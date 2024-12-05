Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07885195808
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733380062; cv=none; b=R/5yCw623BPWjCaI8E1dYesXjPRC6YOZS1au5qdXqhsf+Tiywhqhus5VpE4cnKX2u4vFjLllNVI5rCeY9Gg2iOzck79nqnUSZA0j2puhK8QRgPFRrp9vMSJX1k9lOzuaqJeXGsR8ESVMZMuoqn7MeaKW76mdwJs+se2wTsdGoaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733380062; c=relaxed/simple;
	bh=qS1NPBabbYXkSV9uKTFXDZ1+1kaI8qyGYql2iCfXsR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLdv2LER+k4Xj3bqQLorhjO3Dy6tSBj9V8YpJdidwfDBEU55jBLXcrO+ZVfRUYlBDBwHNB0kfqsqKAW94qIfafkZuuXuPUI/nlKXgMmO+9gJNnpS+mCDC///kl0tRsOTJEDvs1ASMnncuCxZjVmsjFEff7aSAJGYx0YCPv6PO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Z37L6G7Q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z37L6G7Q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725958d5ee0so568240b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Dec 2024 22:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733380059; x=1733984859; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCYS6iztL10oOLNtRWs25ZswwaRh2arrdQMGB4nuP3Q=;
        b=Z37L6G7Q9O3J/jIe9bXpu/w8sGyS3ep1x0k9Ni7TooVNPkTmYSxF7XdacrJv5sDCdP
         Zfc7KdMK3SyuH3ehmGPjRHjub4rE2Of/uRpqGPOp2Y19X8CNsYyl7yYWlZlkvAouOVjI
         oLfrGlf1KVu2OTBV3bAppsdoyjn3QqHtv9kyGlsn5jR1+69cqf7j0rQuNDNWOoM09gGX
         wITdjy3c/Wht771j6ILxHs/aFUmxc/u5IMubuRTexsSMoPl0YiEdmd5DHLIK5UrJMQRY
         T0ERtzBUmkPkPhxU9DwwTjKcrGJLorRHTjKaWZZgLm5sEeFMJAnVqFqeIEvfS7vSjsiY
         d9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733380059; x=1733984859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCYS6iztL10oOLNtRWs25ZswwaRh2arrdQMGB4nuP3Q=;
        b=ZjuOHvDWz57A7ndWGl3gYpovQ8rB43YHOyW8hS8N5otmo+6651I2vIqXRmx5mIJKo8
         MbeT+Y+96W5j84oJxSX4qpyuAeI0snorZ/LkfBajq+OXqcWOMTQfqrUz58/dPCH5Y1ry
         sNK1t3rb+jIBXVSVXhRgofQF8IoTSmjk+NQMIcb4PeRt29GaWIc7TLzrb5eEwPVGo7ti
         1kY5YUbyyCJX5K6eSBSIMw9wvmYAq17Fb/rG6N50ItHPP+YjZfNcvLaGsZsgwZiQsNUa
         V5WYE1gPYTE2qjCyemuIEL8OocALYITuyKG0RxaFYzKstOA6Zf+m5pQsqojWeJePdc0o
         5/pA==
X-Forwarded-Encrypted: i=1; AJvYcCUNl4j7sUd8bE5VjbjNBlnEQCelKy7JXPQungVbhWBLX3P1F3r1eSKa/f3mKdwEx2BJhcLwBJVjTYll0Hlvxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNcihOOiFfCgSZLsqFMZQRvwOgkJodeSxnEhJjRN0bd8Kle6mh
	VojKZtc+yf/UJIBI+YfsK//RSDA8Gi4ev+MD6LT5IYqjgUrbND5Dx4dMLb9Po7c=
X-Gm-Gg: ASbGncsXi/S68jkzKmuLOqC6tp66foXe/cREJ4qCEAH2zBF+6OS5lCCBtHYOcvNfq62
	0R9wbLhjDRE5WPkhjUGXPmGBLbBA+Aygfl8jM+OquO5GgM/zwkihQajUf+puoCqTqkEY1lSZIHT
	mBwamErVowMheIdlYjr+jFE451cKjqFsgnoPgKMKP3GELQtzXTqNe9nmR50Frgs0PONB5mEMZSo
	bzl1wu/ogylzbvuCMzZqqP34QyFoAR/dz2OvMgYSVjw
X-Google-Smtp-Source: AGHT+IFPvyQvWZJgFv3tZ7dxjDrDJ/Mpj5QRafpwVa5PN4Od6vrWdyy5rrj1mByFq7QDEWqX+uF9Gw==
X-Received: by 2002:a05:6a00:2789:b0:725:9cc4:2354 with SMTP id d2e1a72fcca58-7259cc423b6mr4370890b3a.10.1733380057829;
        Wed, 04 Dec 2024 22:27:37 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:f7b6:61d:746e:a663])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd157dd329sm569747a12.85.2024.12.04.22.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 22:27:37 -0800 (PST)
Date: Wed, 4 Dec 2024 22:27:34 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, cocci@inria.fr
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
Message-ID: <Z1FH1qIc7nErHVZ2@ghost>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
 <Z1DnP-GJcfseyrM3@ghost>
 <CAK7LNAR0jmafdi7GAxq58AU-=tuWdVas02q=sQXC4zaOg4JcEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAR0jmafdi7GAxq58AU-=tuWdVas02q=sQXC4zaOg4JcEA@mail.gmail.com>

On Thu, Dec 05, 2024 at 11:48:08AM +0900, Masahiro Yamada wrote:
> On Thu, Dec 5, 2024 at 8:35 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Sun, Nov 10, 2024 at 10:34:33AM +0900, Masahiro Yamada wrote:
> > > Currently, Kbuild always operates in the output directory of the kernel,
> > > even when building external modules. This increases the risk of external
> > > module Makefiles attempting to write to the kernel directory.
> > >
> > > This commit switches the working directory to the external module
> > > directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> > > some build artifacts.
> > >
> > > The command for building external modules maintains backward
> > > compatibility, but Makefiles that rely on working in the kernel
> > > directory may break. In such cases, $(objtree) and $(srctree) should
> > > be used to refer to the output and source directories of the kernel.
> > >
> > > The appearance of the build log will change as follows:
> > >
> > > [Before]
> > >
> > >   $ make -C /path/to/my/linux M=/path/to/my/externel/module
> > >   make: Entering directory '/path/to/my/linux'
> > >     CC [M]  /path/to/my/externel/module/helloworld.o
> > >     MODPOST /path/to/my/externel/module/Module.symvers
> > >     CC [M]  /path/to/my/externel/module/helloworld.mod.o
> > >     CC [M]  /path/to/my/externel/module/.module-common.o
> > >     LD [M]  /path/to/my/externel/module/helloworld.ko
> > >   make: Leaving directory '/path/to/my/linux'
> > >
> > > [After]
> > >
> > >   $ make -C /path/to/my/linux M=/path/to/my/externel/module
> > >   make: Entering directory '/path/to/my/linux'
> > >   make[1]: Entering directory '/path/to/my/externel/module'
> > >     CC [M]  helloworld.o
> > >     MODPOST Module.symvers
> > >     CC [M]  helloworld.mod.o
> > >     CC [M]  .module-common.o
> > >     LD [M]  helloworld.ko
> > >   make[1]: Leaving directory '/path/to/my/externel/module'
> > >   make: Leaving directory '/path/to/my/linux'
> > >
> > > Printing "Entering directory" twice is cumbersome. This will be
> > > addressed later.
> >
> > This change has caused O=<relative directory> to fail.
> >
> > For example:
> >
> > make O=build defconfig
> > make -j$(nproc) V=1 O=build bindeb-pkg
> >
> > outputs:
> >
> > make ARCH=x86 KERNELRELEASE=6.13.0-rc1 KBUILD_BUILD_VERSION=3  run-command KBUILD_RUN_COMMAND='+$(srctree)/scripts/package/builddeb linux-libc-dev'
> > dh_installchangelogs -plinux-image-6.13.0-rc1
> > ../scripts/package/builddeb linux-headers-6.13.0-rc1
> > dh_compress -plinux-image-6.13.0-rc1
> > dh_fixperms -plinux-image-6.13.0-rc1
> > dh_gencontrol -plinux-image-6.13.0-rc1 -- -fdebian/image.files
> > Rebuilding host programs with x86_64-linux-gnu-gcc...
> > make[6]: Entering directory '/scratch/kernels/linux/build'
> > /scratch/kernels/linux/Makefile:190: *** specified kernel directory "build" does not exist.  Stop.
> >
> > It is stepping into this directory and then trying to find the directory
> > it just stepped into so $(realpath $(KBUILD_OUTPUT)) returns an empty
> > string.
> >
> > Using an absolute directory resolves this problem, but I believe it
> > shouldn't be necessary.
> 
> 
> Agree.
> 
> I will apply the following fixup unless I have a better idea.
> 
> 
> 
> 
> diff --git a/scripts/package/install-extmod-build
> b/scripts/package/install-extmod-build
> index 64d958ee45f3..85af1573db31 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -69,7 +69,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
>         #
>         # Use the single-target build to avoid the modpost invocation, which
>         # would overwrite Module.symvers.
> -       "${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> +       "${MAKE}" O=. HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> 
>         cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
>         subdir-y := basic
> @@ -78,7 +78,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
>         EOF
> 
>         # Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
> -       "${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> +       "${MAKE}" O=. HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> 
>         rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
>  fi
> 

Looks fine to me :)

If this is what you decide on, feel free to add my tags.

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> 
> --
> Best Regards
> Masahiro Yamada
