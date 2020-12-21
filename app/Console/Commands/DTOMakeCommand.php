<?php

namespace App\Console\Commands;

use Illuminate\Support\Str;
use Illuminate\Console\GeneratorCommand;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class DTOMakeCommand extends GeneratorCommand
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'make:dto';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a new dto class';

    /**
     * The type of class being generated.
     *
     * @var string
     */
    protected $type = 'DTO';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        $this->model = class_basename($this->getNameInput());
        $this->setPathFile();

        $this->input->setArgument('name', $this->model . "DTO");

        if (parent::handle() === false && !$this->option('force')) {
            return false;
        }
    }

    private function setPathFile()
    {
        $this->path  = explode("\\", $this->getNameInput());
        array_pop($this->path);
        $this->path = implode("\\", $this->path);
    }
    
    /**
     * Replace the class name for the given stub.
     *
     * @param  string  $stub
     * @param  string  $name
     * @return string
     */
    protected function replaceClass($stub, $name)
    {
        $stub = parent::replaceClass($stub, $name);
        $path = !empty($this->path) ? "\\" . $this->path : "";

        return str_replace(array('{{dto}}', '{{path}}'), array($this->model, $path), $stub);
    }

    /**
     * 
     * Get the stub file for the generator.
     *
     * @return string
     */
    protected function getStub()
    {
        return  base_path('stubs/DTO/DTO.stub');
    }
    /**
     * Get the default namespace for the class.
     *
     * @param  string  $rootNamespace
     * @return string
     */
    protected function getDefaultNamespace($rootNamespace)
    {
        return  $rootNamespace . '\DTO\\' . $this->path;
    }

    /**
     * Get the console command arguments.
     *
     * @return array
     */
    protected function getArguments()
    {
        return [
            ['name', InputArgument::REQUIRED, 'The name of the dto class.'],
        ];
    }

    /**
     * Get the console command options.
     *
     * @return array
     */
    protected function getOptions()
    {
        return [
            ['force', null, InputOption::VALUE_NONE, 'Create the class even if the dto already exists'],
        ];
    }
}
