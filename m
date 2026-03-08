Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D9392C29
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995138; cv=none; b=DS8qIylAbpY+26uhWmITDppGmy5FvXtcEIT8601GiYvlGN1I3dU1S5XGh7jarWtojF51f+TY5wd5IjEi0DpVBUzcz0p0dIN4PmDR9EUJO7Mfw9fOMmlCWT9KiUL+lzUHPZ545+mThfyR1HXbsFkG5O5SFvfL6o/UBdbE8DyP7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995138; c=relaxed/simple;
	bh=/8bipe/3tMY4IJIMVQf4wllkt8Udd65TDepU8wPKQd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLkZ5w+wBseX2t8mKGjsg7Ks8w6qiDIDNwetb4i7XG6uqcn1MnrnDFQkTnVIFI6BPeez7bYgG1XRKrMbj0lc66qHQaq6UxeHVk8PJY4u6UpIfgquf78LuwGHrIkikWGXpcUb9xdmcvVjpxZbpKptVU5+THO/Vuj4mma371T66c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4v0JDY9; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4v0JDY9"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be1c918173so11533421eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772995135; x=1773599935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KvLNpj9GFBrM6+ftSwcXj1FerE3X7/0dOdyWMKFg5A=;
        b=k4v0JDY9SBlOQ4N061OZlMHQzqrY1P14C46LUbr55aWzsdjwfLEsaN2ptrRR1/S7SV
         D9IIRnJRaltV14IPTzAfnQLYHJJGSq8pVKBuWFl8ciASPIm3y7SJviSt2PsrSKGy3xij
         f0jYDOsrfSBpiyW8MXK91IWjEX/0pFOe46yIyYuUWkCI4WGjwkcyri9hVoaBpCbWnHbc
         6Zq7DRMC2xlFLNP56Y+kMazWeTHSbLyaIofOCeQS/I50LvyuFbE0ujthblaGBoE7U/Xs
         SYFPYNIiKNAQyFEGDgMRoD5b6yJ7VYwqSApugcLO378BdgvJdRO1HnMMiT65j8IEw1Ci
         AruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772995135; x=1773599935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KvLNpj9GFBrM6+ftSwcXj1FerE3X7/0dOdyWMKFg5A=;
        b=FWpIQaZ3cbxJD6us+SMic9Hw5FchxWMZA6ikPOhp25GA9xQYB+E3M4aOGd/UCFJqac
         +BfZ0dVB/HgoV8Houcl3aANjkbzJ1RUtedufk6wrtFzDkhEEK7ixlLEikaCXAhSSWl7W
         Phy6ELikumg/ggkSx0MgoyRcaaz8LhCRrMijBzS4fCIQrfhN9EcVw+mYTxvyVuC2+FJk
         NMj9jX6GP4QTvGiwbyiGcxByxAL/YKr4Vrd8Xx8BvuJQls+r/7RGxhXtyqJYq5JDzM0P
         ZNLfBtWYqer/haEVIu5ASwHSRNTSzv4H8CzsebStX4e5keOfsnjLwW473emluWzGuxYG
         yjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEk3ugtGmfrt0Kpyzxc+tX3NTVKtF5br9lfoAtyUso3STvY0EaR5OQe/i8htCfmQZPPswmdy5dqbgsw2fyPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydCjd3QI+QR7hXs0xrnUk9NeWexu1WJgXT0u2EFYfq4gcSEa+b
	9/Co8cLR/79nyyDoRJRnpB2trCSRad1e7QVYH2MJ9gnjVFS9GuiujLZG0XI2EQ==
X-Gm-Gg: ATEYQzwKxHVhF0NnT74NpL+IRASXwz3aYGdGX09aTw7aUgJUmUiret7Fz97m2OfEpy1
	8xmO2NMiw5j8SOYKJx/lHIUyfQd4VZ1KyTjWMcDOzit3b4Y4WT7g5Kt1LAuaWWW0k6bHrMJStOS
	u7pPDQBAsRQc6y4/bm8POWZwETbH20CKWH9Xml5GfkQUv8+ciccr2qy/oZNulhpipjK+SrjhDGw
	XXLY8SpMgbPlhrOcqXn0yjzkVMlyhZLg4JHOsSR0mqeihVySeucSJlhrCOvlxluLaejq3VIOE+F
	0a9eYUzCOrt9ZNNUar0sy4kymriua69oQNqmnnf689fZBfrkaTmDen/A5Fgk3Bk9XLKfhP0nTm+
	UhIgwkYDxEbrjm5r9/iwDfe6CQskU21NjJn4nBFC7X0AyJI/xgkr6UFu7H7CNsndE3U++PdN1QS
	cFN5ougHLqJrYq1zBJbJoK4EmZOo7pqLgiM16nXgYh
X-Received: by 2002:a05:7301:4094:b0:2be:1dc7:999a with SMTP id 5a478bee46e88-2be4de901bfmr3867624eec.4.1772995134564;
        Sun, 08 Mar 2026 11:38:54 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82851esm6032243eec.10.2026.03.08.11.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:38:54 -0700 (PDT)
Message-ID: <21e89ec2-074c-48dc-9a35-ee8ce45b7b69@gmail.com>
Date: Sun, 8 Mar 2026 11:38:53 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs: sp_SP: Add Spanish translation for Rust
 quick-start
To: Edwin Toribio <edwin.toribio.j@gmail.com>
Cc: carlos.bilbao@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-2-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260304200715.76360-2-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/4/26 12:07, Edwin Toribio wrote:
> Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>
> ---
>   .../translations/sp_SP/rust/quick-start.rst   | 384 ++++++++++++++++++
>   1 file changed, 384 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst
>
> diff --git a/Documentation/translations/sp_SP/rust/quick-start.rst b/Documentation/translations/sp_SP/rust/quick-start.rst
> new file mode 100644
> index 000000000..276b81971
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/rust/quick-start.rst
> @@ -0,0 +1,384 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-sp.rst
> +
> +:Original: Documentation/rust/quick-start.rst
> +:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
> +
> +.. _sp_rust_quick_start:
> +
> +Guía de inicio rápido
> +=====================
> +
> +Este documento describe cómo empezar con el desarrollo del kernel en Rust.
> +
> +Existen varias formas de instalar el conjunto de herramientas (toolchain) de Rust
> +necesario para el desarrollo del kernel. Una forma sencilla es utilizar los
> +paquetes de su distribución de Linux si son adecuados; la primera sección a
> +continuación explica este enfoque. Una ventaja de este método es que,
> +normalmente, la distribución hará coincidir el LLVM utilizado por Rust y Clang.
> +
> +Otra forma es utilizar las versiones estables precompiladas de LLVM+Rust
> +proporcionadas en `kernel.org <https://kernel.org/pub/tools/llvm/rust/>`_.
> +Estas son las mismas herramientas de LLVM ligeras y rápidas de
> +:ref:`Obtener LLVM <getting_llvm>` con versiones de Rust añadidas que son


BTW, I did get a warning here:

quick-start.rst:21: WARNING: undefined label: 'getting_llvm'


> +compatibles con Rust para Linux. Se proporcionan dos conjuntos: el "LLVM más
> +reciente" (latest LLVM) y el "LLVM coincidente" (matching LLVM) (consulte el
> +enlace para más información).
> +
> +Alternativamente, las dos secciones siguientes de "Requisitos" explican cada
> +componente y cómo instalarlos a través de ``rustup``, los instaladores
> +independientes de Rust y/o compilándolos.
> +
> +El resto del documento explica otros aspectos sobre cómo empezar.
> +
> +
> +Distribuciones
> +--------------
> +
> +Arch Linux
> +**********
> +
> +Arch Linux proporciona versiones recientes de Rust y, por lo tanto, debería
> +funcionar directamente, p. ej.::
> +
> +    pacman -S rust rust-src rust-bindgen
> +
> +
> +Debian
> +******
> +
> +Debian 13 (Trixie), así como Testing y Debian Unstable (Sid) proporcionan
> +versiones recientes de Rust y, por lo tanto, deberían funcionar directamente, p. ej.::
> +
> +    apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +
> +Fedora Linux
> +************
> +
> +Fedora Linux proporciona versiones recientes de Rust y, por lo tanto, debería
> +funcionar directamente, p. ej.::
> +
> +    dnf install rust rust-src bindgen-cli rustfmt clippy
> +
> +
> +Gentoo Linux
> +************
> +
> +Gentoo Linux (y especialmente la rama de pruebas) proporciona versiones
> +recientes de Rust y, por lo tanto, debería funcionar directamente, p. ej.::
> +
> +    USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
> +
> +Es posible que sea necesario configurar ``LIBCLANG_PATH``.
> +
> +
> +Nix
> +***
> +
> +Nix (canal unstable) proporciona versiones recientes de Rust y, por lo tanto,
> +debería funcionar directamente, p. ej.::
> +
> +    { pkgs ? import <nixpkgs> {} }:
> +    pkgs.mkShell {
> +      nativeBuildInputs = with pkgs; [ rustc rust-bindgen rustfmt clippy ];
> +      RUST_LIB_SRC = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
> +    }
> +
> +
> +openSUSE
> +********
> +
> +openSUSE Slowroll y openSUSE Tumbleweed proporcionan versiones recientes de Rust
> +y, por lo tanto, deberían funcionar directamente, p. ej.::
> +
> +    zypper install rust rust1.79-src rust-bindgen clang
> +
> +
> +Ubuntu
> +******
> +
> +25.04
> +~~~~~
> +
> +Las versiones más recientes de Ubuntu proporcionan versiones recientes de Rust
> +y, por lo tanto, deberían funcionar directamente, p. ej.::
> +
> +    apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +Además, es necesario configurar ``RUST_LIB_SRC``, p. ej.::
> +
> +    RUST_LIB_SRC=/usr/src/rustc-$(rustc --version | cut -d' ' -f2)/library
> +
> +Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
> +
> +
> +24.04 LTS y anteriores
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Aunque Ubuntu 24.04 LTS y versiones anteriores todavía proporcionan versiones
> +recientes de Rust, requieren que se establezca alguna configuración adicional,
> +utilizando los paquetes con versión, p. ej.::
> +
> +    apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
> +        rust-1.80-clippy
> +    ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
> +    ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
> +
> +Ninguno de estos paquetes establece sus herramientas como predeterminadas; por
> +lo tanto, deben especificarse explícitamente, p. ej.::
> +
> +    make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
> +        CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
> +
> +Alternativamente, modifique la variable ``PATH`` para colocar los binarios de
> +Rust 1.80 primero y establezca ``bindgen`` como predeterminado, p. ej.::
> +
> +    PATH=/usr/lib/rust-1.80/bin:$PATH
> +    update-alternatives --install /usr/bin/bindgen bindgen \
> +        /usr/bin/bindgen-0.65 100
> +    update-alternatives --set bindgen /usr/bin/bindgen-0.65
> +
> +``RUST_LIB_SRC`` debe configurarse cuando se usan los paquetes con versión, p. ej.::
> +
> +    RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
> +
> +Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
> +
> +Además, ``bindgen-0.65`` está disponible en versiones más nuevas (24.04 LTS y
> +24.10), pero puede no estar disponible en las más antiguas (20.04 LTS y 22.04 LTS),
> +por lo que es posible que sea necesario compilar ``bindgen`` manualmente
> +(consulte más abajo).
> +
> +
> +Requisitos: Compilación
> +-----------------------
> +
> +Esta sección explica cómo obtener las herramientas necesarias para la compilación.
> +
> +Para comprobar fácilmente si se cumplen los requisitos, se puede utilizar el
> +siguiente objetivo (target)::
> +
> +    make LLVM=1 rustavailable
> +
> +Esto activa la misma lógica utilizada por Kconfig para determinar si debe
> +habilitarse ``RUST_IS_AVAILABLE``; pero también explica por qué no en caso
> +de que así sea.
> +
> +
> +rustc
> +*****
> +
> +Se requiere una versión reciente del compilador de Rust.
> +
> +Si se está utilizando ``rustup``, entre en el directorio de compilación del
> +kernel (o use el argumento ``--path=<build-dir>`` para el subcomando ``set``)
> +y ejecute, por ejemplo::
> +
> +    rustup override set stable
> +
> +Esto configurará su directorio de trabajo para usar la versión dada de
> +``rustc`` sin afectar a su conjunto de herramientas predeterminado.
> +
> +Tenga en cuenta que la anulación (override) se aplica al directorio de trabajo
> +actual (y sus subdirectorios).
> +
> +Si no está utilizando ``rustup``, obtenga un instalador independiente de:
> +
> +    https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
> +
> +
> +Código fuente de la biblioteca estándar de Rust
> +***********************************************
> +
> +Se requiere el código fuente de la biblioteca estándar de Rust porque el sistema
> +de compilación compilará de forma cruzada ``core``.
> +
> +Si se está utilizando ``rustup``, ejecute::
> +
> +    rustup component add rust-src
> +
> +Los componentes se instalan por conjunto de herramientas, por lo que actualizar
> +la versión del compilador de Rust más adelante requiere volver a añadir el
> +componente.
> +
> +De lo contrario, si se utiliza un instalador independiente, el árbol de fuentes
> +de Rust puede descargarse en la carpeta de instalación del conjunto de
> +herramientas::
> +
> +    curl -L "https://static.rust-lang.org/dist/rust-src-$(rustc --version | cut -d' ' -f2).tar.gz" |
> +        tar -xzf - -C "$(rustc --print sysroot)/lib" \
> +        "rust-src-$(rustc --version | cut -d' ' -f2)/rust-src/lib/" \
> +        --strip-components=3
> +
> +En este caso, actualizar la versión del compilador de Rust más adelante requiere
> +actualizar manualmente el árbol de fuentes (esto se puede hacer eliminando
> +``$(rustc --print sysroot)/lib/rustlib/src/rust`` y volviendo a ejecutar el
> +comando anterior).
> +
> +
> +libclang
> +********
> +
> +``libclang`` (parte de LLVM) es utilizado por ``bindgen`` para entender el
> +código C en el kernel, lo que significa que LLVM debe estar instalado; al igual
> +que cuando el kernel se compila con ``LLVM=1``.
> +
> +Es probable que las distribuciones de Linux tengan una adecuada disponible, por
> +lo que es mejor comprobarlo primero.
> +
> +También hay algunos binarios para varios sistemas y arquitecturas subidos a:
> +
> +    https://releases.llvm.org/download.html
> +
> +De lo contrario, compilar LLVM lleva bastante tiempo, pero no es un proceso
> +complejo:
> +
> +    https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
> +
> +Consulte Documentation/kbuild/llvm.rst para obtener más información y otras
> +formas de obtener versiones precompiladas y paquetes de distribuciones.
> +
> +
> +bindgen
> +*******
> +
> +Los vínculos (bindings) con la parte de C del kernel se generan en tiempo de
> +compilación utilizando la herramienta ``bindgen``.
> +
> +Instálela, por ejemplo, mediante (tenga en cuenta que esto descargará y
> +compilará la herramienta desde el código fuente)::
> +
> +    cargo install --locked bindgen-cli
> +
> +``bindgen`` utiliza la caja (crate) ``clang-sys`` para encontrar un
> +``libclang`` adecuado (que puede estar vinculado estáticamente, dinámicamente
> +o cargado en tiempo de ejecución). Por defecto, el comando ``cargo`` anterior
> +producirá un binario ``bindgen`` que cargará ``libclang`` en tiempo de
> +ejecución. Si no se encuentra (o si se debe usar un ``libclang`` diferente al
> +encontrado), el proceso se puede ajustar, p. ej. utilizando la variable de entorno
> +``LIBCLANG_PATH``. Para más detalles, consulte la documentación de
> +``clang-sys`` en:
> +
> +    https://github.com/KyleMayes/clang-sys#linking
> +
> +    https://github.com/KyleMayes/clang-sys#environment-variables
> +
> +
> +Requisitos: Desarrollo
> +----------------------
> +
> +Esta sección explica cómo obtener las herramientas necesarias para el
> +desarrollo. Es decir, no son necesarias cuando solo se compila el kernel.
> +
> +
> +rustfmt
> +*******
> +
> +La herramienta ``rustfmt`` se utiliza para formatear automáticamente todo el
> +código Rust del kernel, incluyendo los vínculos de C generados (para más
> +detalles, consulte coding-guidelines.rst).
> +
> +Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
> +lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
> +puede instalarse manualmente::
> +
> +    rustup component add rustfmt
> +
> +Los instaladores independientes también vienen con ``rustfmt``.
> +
> +
> +clippy
> +******
> +
> +``clippy`` es un linter de Rust. Ejecutarlo proporciona advertencias
> +adicionales para el código Rust. Se puede ejecutar pasando ``CLIPPY=1`` a
> +``make`` (para más detalles, consulte general-information.rst).
> +
> +Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
> +lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
> +puede instalarse manualmente::
> +
> +    rustup component add clippy
> +
> +Los instaladores independientes también vienen con ``clippy``.
> +
> +
> +rustdoc
> +*******
> +
> +``rustdoc`` es la herramienta de documentación para Rust. Genera una atractiva
> +documentación en HTML para el código Rust (para más detalles, consulte
> +general-information.rst).
> +
> +``rustdoc`` también se utiliza para probar los ejemplos proporcionados en el
> +código Rust documentado (llamados doctests o pruebas de documentación). El
> +objetivo de Make ``rusttest`` utiliza esta función.
> +
> +Si se utiliza ``rustup``, todos los perfiles ya instalan la herramienta, por
> +lo que no es necesario hacer nada.
> +
> +Los instaladores independientes también vienen con ``rustdoc``.
> +
> +
> +rust-analyzer
> +*************
> +
> +El servidor de lenguaje `rust-analyzer <https://rust-analyzer.github.io/>`_
> +puede utilizarse con muchos editores para habilitar el resaltado de sintaxis,
> +el completado, el salto a la definición y otras funciones.
> +
> +``rust-analyzer`` necesita un archivo de configuración, ``rust-project.json``,
> +que puede generarse mediante el objetivo de Make ``rust-analyzer``::
> +
> +    make LLVM=1 rust-analyzer
> +
> +
> +Configuración
> +-------------
> +
> +El ``Rust support`` (``CONFIG_RUST``) debe habilitarse en el menú
> +``General setup``. La opción solo se muestra si se encuentra un conjunto de
> +herramientas de Rust adecuado (véase arriba), siempre que se cumplan los demás
> +requisitos. A su vez, esto hará visibles el resto de las opciones que
> +dependen de Rust.
> +
> +A continuación, vaya a::
> +
> +    Kernel hacking
> +        -> Sample kernel code
> +            -> Rust samples
> +
> +Y habilite algunos módulos de ejemplo, ya sea como integrados (built-in) o
> +como cargables.
> +
> +
> +Compilación
> +-----------
> +
> +Compilar un kernel con un conjunto de herramientas LLVM completo es la
> +configuración mejor soportada en este momento. Es decir::
> +
> +    make LLVM=1
> +
> +El uso de GCC también funciona para algunas configuraciones, pero es muy
> +experimental en este momento.
> +
> +
> +Hacking
> +-------
> +
> +Para profundizar más, eche un vistazo al código fuente de los ejemplos en
> +``samples/rust/``, al código de soporte de Rust bajo ``rust/`` y al menú
> +``Rust hacking`` bajo ``Kernel hacking``.
> +
> +Si se utiliza GDB/Binutils y los símbolos de Rust no se decodifican (demangle)
> +correctamente, la razón es que el conjunto de herramientas aún no soporta el
> +nuevo esquema de decoración de nombres (mangling) v0 de Rust. Hay algunas
> +soluciones:
> +
> +- Instalar una versión más reciente (GDB >= 10.2, Binutils >= 2.36).
> +
> +- Algunas versiones de GDB (p. ej. GDB 10.1 estándar) pueden utilizar los nombres
> +  pre-decodificados incrustados en la información de depuración(``CONFIG_DEBUG_INFO``).
> \ No newline at end of file
