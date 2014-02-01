package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(HorarioController)
@Mock(Horario)
class HorarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/horario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.horarioInstanceList.size() == 0
        assert model.horarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.horarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.horarioInstance != null
        assert view == '/horario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/horario/show/1'
        assert controller.flash.message != null
        assert Horario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/horario/list'

        populateValidParams(params)
        def horario = new Horario(params)

        assert horario.save() != null

        params.id = horario.id

        def model = controller.show()

        assert model.horarioInstance == horario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/horario/list'

        populateValidParams(params)
        def horario = new Horario(params)

        assert horario.save() != null

        params.id = horario.id

        def model = controller.edit()

        assert model.horarioInstance == horario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/horario/list'

        response.reset()

        populateValidParams(params)
        def horario = new Horario(params)

        assert horario.save() != null

        // test invalid parameters in update
        params.id = horario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/horario/edit"
        assert model.horarioInstance != null

        horario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/horario/show/$horario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        horario.clearErrors()

        populateValidParams(params)
        params.id = horario.id
        params.version = -1
        controller.update()

        assert view == "/horario/edit"
        assert model.horarioInstance != null
        assert model.horarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/horario/list'

        response.reset()

        populateValidParams(params)
        def horario = new Horario(params)

        assert horario.save() != null
        assert Horario.count() == 1

        params.id = horario.id

        controller.delete()

        assert Horario.count() == 0
        assert Horario.get(horario.id) == null
        assert response.redirectedUrl == '/horario/list'
    }
}
