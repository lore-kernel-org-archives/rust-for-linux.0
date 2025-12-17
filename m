Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CAB16A956
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004413; cv=none; b=r7R1gLCdqPh0mhVVPQ8SwltMSCpm8d4rZIeP13zdgqkwsHlkth2oeJXwl/XHwktTQbvFUJDchEk17oYELdfEv+FsLLHqRyQ3bKu3okyY3KoTQ3T3xfEtN3KUamnurN2dHbqhGrRWrSt8bX2XfnUHu67Rsih2Xz2QGcOPieIq85I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004413; c=relaxed/simple;
	bh=snI2wYHji5W5IAsxgqZnbNF+ycV03vQg7gTeRpXnXgM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZarrJWaNm0r2RZsqzu5B8Mp2dNbYOBnV4W+msHcVAn28fgC3h4VG5BwhYIGJqCaWU4HhUaDStkUTynE/nrVVTDuuW+mJdmAm3Bf1NZ2qlD7aFEmaQ5pWIXJkfRaCm7IgIN9U5khtyPC141WGDimVySkOmSlsy+szWreqF0a4wD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qrt3+Oq1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qrt3+Oq1"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779da35d27so57358305e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766004410; x=1766609210; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4MKxu9qlwmcGzNlxwyQwvVTF0l2Eb8rBsj0Zt0Vrbo=;
        b=Qrt3+Oq1sgKjovf5hAelgq3aLQrbae5YGkED4dsuBU6FGtLXG8GQQ+SZEma1O6NCjz
         lboS1ZPZ/iLIhrbLZUwXeVMxT4aU7prqYZU9Z6xCew3Xazj8iju/108hvCpxn2AjM5X4
         BqRZSi2jMBKjI/pQSzTJ2ZHdEkI/8nqPA7wDwPaaHEgP8LnoBAUi7L0JuW+jHflSF4Mv
         GCFfq5VzaUokpJFa2ePAiwWMoWcRAJbswhC9vuDpmQRuUayzVl6Ic0aUAVYBjMnWQ7fu
         YM511/3Np6oGWANzN6o0uRSL4GYyqiIHCnobP+ruvZrgI4i7OPnKI2WjUVJIz8GB/66l
         2lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004410; x=1766609210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4MKxu9qlwmcGzNlxwyQwvVTF0l2Eb8rBsj0Zt0Vrbo=;
        b=XEtntLfQSW8ylsbTlwUTpHjJwliKSQ3AkDcM/CHFzRcPO08owpts5n4GvTwVdUq17D
         Qq94H1DzKTDwpcGsQ6eSvQUi99DZN4E41tbAWuvL8WBnoOZQZ59GSYJcd/f8wih0KIQr
         HSRj6gIZaeXZoaB94UqR6Bg3dE9MQfnBiFMkdGrPz/QZS3cc+6vrV5MueO9i3khTeRnl
         VL4BuPJ0FhatgVA6f5zUXufOnw2u4zOSBhlVUPLqxnDx0nu3slwatUBgw/FYWSqn4uaA
         +KB9Fl+9jYTV1QYITozRIodTHON+iXBcvIc+ZEKYTYNxDHpZ1S4q+jWddlR1+rJYvx/S
         seNQ==
X-Gm-Message-State: AOJu0Yw7K+Qls22n6QRyUcnBTkbysLnyfgFsx4pxwpiGlcD1mzXq7JH+
	Dom6aNbuguRDa0c21xajE/M5PawNkEZ8bt3lGgxaWKJ755LBKI4Ms5YAUDJVmdNeh9C1ae5cfqv
	lQKXQX+3peoy7P7r4hQ==
X-Google-Smtp-Source: AGHT+IGB7bPBzh+VYhSLfceBAKHypNI+JJU00l15l5DxF3NQ8tpBZHdZreHd1VP7ODZkTidxEjk+RzBHKr8XwGU=
X-Received: from wmgp8.prod.google.com ([2002:a05:600c:2048:b0:47a:98a6:7c41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a46:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47a8f8a7d03mr198466345e9.4.1766004410574;
 Wed, 17 Dec 2025 12:46:50 -0800 (PST)
Date: Wed, 17 Dec 2025 20:46:49 +0000
In-Reply-To: <20251217150010.665153-1-siddhesh@gotplt.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251217150010.665153-1-siddhesh@gotplt.org>
Message-ID: <aUMWuezmBHFnZUaM@google.com>
Subject: Re: [PATCH] rust: Add -fdiagnostics-show-context to bindgen_skip_c_flags
From: Alice Ryhl <aliceryhl@google.com>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 17, 2025 at 10:00:10AM -0500, Siddhesh Poyarekar wrote:
> This got added with:
> 
>   7454048db27d6 ("kbuild: Enable GCC diagnostic context for value-tracking warnings")
> 
> but clang does not have this option, so avoid passing it to bindgen.
> 
> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

Seems like this should have a fixes tag for the offending commit, and cc
stable?

Alice

>  rust/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704..4dcc2eff51cb 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -383,6 +383,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> +	-fdiagnostics-show-context -fdiagnostics-show-context=% \
>  	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
>  
>  # Derived from `scripts/Makefile.clang`.
> -- 
> 2.52.0
> 
