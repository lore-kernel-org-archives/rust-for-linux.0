Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="isan1Ywn"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B8610E3
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 05:15:38 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c2308faedso9686285e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 05:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1701954937; x=1702559737; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=vXBhwuCvvvVPxLSaqsTNZeHrwdJ2FqaI15RxVJK0Iac=;
        b=isan1YwnGryF6AeddCVH7DAMBtBnfEV7sMLNGn5jyDg4VF8eJP7EhcUpKTekj0tZzL
         ZQxyk2VZPcFBmlUuCrEwf1oqy35hZsUcJSf5hkZD+Kkxw7V7WUc+vRF2SF9OygAPev3S
         gvSD/v9irg/oRyozGudOEZgNMSFvgaB3zRfXfJeg9RWKg5EE/pVzLGPdDkCQBsQCzW93
         B+VH+OkFNhr/+hzDYS+7+PmpJtx2VZr/CJ4QyzHyQuv+O5s4sufx9F+dxFK22W9w7hqX
         SeeI58Nf2+4QJ4NdMMxjXm6sUIJ6ZNYCXDcssoK+0fNVxaoOjHzXlCARXdbqdivgMUL1
         kRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954937; x=1702559737;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXBhwuCvvvVPxLSaqsTNZeHrwdJ2FqaI15RxVJK0Iac=;
        b=KbDoEbxM8EcqWuYkkwejOcpd1ZUBASykEnZW3EljwSeNlELNht15RfrMvY5LCIIV8D
         7+mArzLXavXPI+p7lSR1gao3Ik4dSP3pYE4WAcmu9ZFDFXYSkPMzrAc2VEzRsTCYRHHo
         XVoIMy4wLXNr0fX0y3S2CoGYYjKpCm9E2JeDJqjkcC1GtvCid7z4fCigxZNwDGb2cwFS
         2PvnGAQGOt6MFy6nHMnAkvMzs5AxQsdQ6O2PUWUy0dOaPz8Wgc3zIuGCLDNYuIgKnL9P
         qeqDPn2VpvtFA4b8WvTbYyHSmIaOzG+TSvuAGvZXlmFCaWQdgrPRAhYJf0+tjujrZ1pb
         YCiA==
X-Gm-Message-State: AOJu0YzxJXcVqFJjRYSGtZdLd6sldWZ9MrQi/ZdaMc127vwkqV63l8HF
	lYZiw5TZAae09m2rYI+jQt37gg==
X-Google-Smtp-Source: AGHT+IFmpMyQITmpHQreXlenBga4HLrNyP5TPSSppQHYQJx4WQcCzLI/RngWVEKmlRDzVwVPC5X7Gg==
X-Received: by 2002:a05:600c:3d99:b0:40b:5e59:c592 with SMTP id bi25-20020a05600c3d9900b0040b5e59c592mr1631297wmb.188.1701954936752;
        Thu, 07 Dec 2023 05:15:36 -0800 (PST)
Received: from localhost ([147.161.155.112])
        by smtp.gmail.com with ESMTPSA id dp12-20020a0560000c8c00b0033346fe9b9bsm1417664wrb.83.2023.12.07.05.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:15:36 -0800 (PST)
References: <20231207084846.faset66xzuoyvdlg@vireshk-i7>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [BUG] Rustup override doesn't work with O=<build dir>
Date: Thu, 07 Dec 2023 14:10:55 +0100
In-reply-to: <20231207084846.faset66xzuoyvdlg@vireshk-i7>
Message-ID: <878r66jgqx.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Viresh Kumar <viresh.kumar@linaro.org> writes:

> But when I build the kernel with O=<build dir>, I get:
> "Rust compiler 'rustc' is too new. This may or may not work."
>
> Setting the override for the build directory too fixes it. Not sure how to fix
> Makefile for this and so reporting here.

I don't think this is a bug. You should set the override for the build
directory. You do not need to set it for the kernel directory if you are
not building in it.

I use the following justfile, perhaps that is helpful:

rustup path="linux":
    #!/bin/bash
    version="$({{path}}/scripts/min-tool-version.sh bindgen)"
    mkdir -p {{path}}-build
    rustup override set --path={{path}}-build $({{path}}/scripts/min-tool-version.sh rustc)
    cargo install bindgen-cli --locked --version "$version" --root $(pwd)/bindgen-"$version"
    rustup component add rust-src


Best regards,
Andreas
