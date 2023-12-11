Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="VndMP9Rq"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD081E5
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 00:11:36 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1f8f470903so138116966b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1702282295; x=1702887095; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=qcJzdfqObNDmtw7E9OrdNF6CpUIv0YRzgPXgPrIHK7o=;
        b=VndMP9Rqnng4v4Sd3w9eRoLvN0kibuwPDQMdKcLOkKE5tKwpEhsO9CkgEDDEwf2s2Z
         bS/0oKUdp3/jobvstS8VZgmvh4jNv+F2q1Ixu1sXD8cN6J8/3wgotZZRwjx7vtkKU6ah
         txq//rzHw5kaFVqN2lTkTINYXHFXCEpRX9f7zUmhVhZpAsqBEQz5ezIkdj3l2eSSGmoh
         TuNmfWgAi8p4rsHy5Wai/eldjDBPon3mp5usyOCLWZrinHJGUev9KgZczEVAJ1d5Taqe
         7ll9J5LGC8aT4on1MzpSnyiTH1+42+gjuwcVI5UcKXBcFsJGEhDyzePPBAR0lYR3kARW
         YISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282295; x=1702887095;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcJzdfqObNDmtw7E9OrdNF6CpUIv0YRzgPXgPrIHK7o=;
        b=ohBFPNfNCZTYuiMZp9F0+SBQD/rCHXtbtVAMKOBLnhlpvw9ESi25+i9VLR6IrN+zAA
         CevgIwY+Jj8cfCZzNoRu96kzFIzmDG0C54kUnylDharGnEGw8tHrT+17HGcCZv8+q2Es
         D5EfSU6EAzDGylpBI/yYYXk2YlJeNbkHIqtK4nxIP49bwTNnBcrZqBik4ShQrE8ro0mu
         JT/zNo0tgGwwhQes/M6EH767C04nkBveHRX6WVm4DpRv3vhIQreh6EDLEXr9EO9htDWE
         R9HGagkYbymIYYFk6//Jjnrq7uSshfKeQCiUJUoItpo088m5VIG3DPsCWuhAtbk9RHmo
         Z7Kg==
X-Gm-Message-State: AOJu0Yx7kEdpHb8OrDv9I+w7T3dmwHSbqnjtee1r3o0dHwo+jY1o6Bey
	LHlw7O2MThbhjMUnKE+j4ewjfQ==
X-Google-Smtp-Source: AGHT+IEWPPXjJlNrj3NjX+wLy7GNr35ypGKtIG66b5BUVBjQy06MhULrNT8Tm43Kdd2wfuFP7zdwAw==
X-Received: by 2002:a17:907:8688:b0:a1d:5b0d:1c42 with SMTP id qa8-20020a170907868800b00a1d5b0d1c42mr2695236ejc.35.1702282295196;
        Mon, 11 Dec 2023 00:11:35 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm4425472eja.217.2023.12.11.00.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:11:34 -0800 (PST)
References: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
 <4738ad1c-eb54-4ad6-98c8-3852de3e8fc3@proton.me>
 <20231211064742.63l4cmvxe4uso5us@vireshk-i7>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>,
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, Vincent Guittot
 <vincent.guittot@linaro.org>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: rust: Clarify that 'rustup override' applies to
 build directory
Date: Mon, 11 Dec 2023 09:09:22 +0100
In-reply-to: <20231211064742.63l4cmvxe4uso5us@vireshk-i7>
Message-ID: <87h6kpf9am.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Thanks for fixing this Viresh!

Viresh Kumar <viresh.kumar@linaro.org> writes:

> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> index f382914f4191..dee787f92d26 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -33,14 +33,17 @@ A particular version of the Rust compiler is required. Newer versions may or
>  may not work because, for the moment, the kernel depends on some unstable
>  Rust features.
>
> -If ``rustup`` is being used, enter the checked out source code directory
> -and run::
> +If ``rustup`` is being used, enter the kernel build directory and run::
>
>         rustup override set $(scripts/min-tool-version.sh rustc)

How about just specifying the path here:

         rustup override set --path=<build-dir> $(scripts/min-tool-version.sh rustc)

Best regards,
Andreas

