Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F67287245
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759435853; cv=none; b=NRjA4lkC51rI6SO7qb7rGreE0+nvtPGAgG+5ZechJ8tZ2hM/Isvvk6eL1WryWZvdzAVPOlJ2FyUNdk207LHy0lLG/UHcrflwwIys0n+7WIoo1+svKwicr/iR5nDEpgkjv1P65HeCSaYHLjL8Z5bk0rkhVlgA2MmAbDy2FGRdQsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759435853; c=relaxed/simple;
	bh=zDrJU+xLe4kf0WdPsZx2eTyictNcHlbYnwaLRA0CUyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnxZi6MwPBkWQCDm8EWq3LFTshSzavckkm6i8oW0DgmUzcTpAp8xOI8kn6cAOyUAX8bQEygcIVcKjsXrjtLmeRcnmCNVsSYhWP1NEdQ82eLNgKYt8KbKfzH3Ca69ML+5HP5wjP8KcnbQfiC88TjuFx/PPQ2IVdMaLKQts49r8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUQbeT0k; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUQbeT0k"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e3ea0445fso7933085e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759435850; x=1760040650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yptgqm0jFxFfgcs9+GgM4ctol149fL7+2Ynqpr6fO9I=;
        b=wUQbeT0kSd1Ei52hN2AbpiMy6ZdRFGLwKk3UC2jeNh/ys51/BVw+xix+i+de5a25je
         oqYyUgLQLeDgvpZyR5KrSUA+cG/fWrM/eiwAZZepotH32L+B0OLfohI0FSki4aLGWlxY
         l3eluRcfx6rN4DeXUwJiTT4iv0sb4dO12S7zKOZ1Ap8cWZcBNVTc/Kf2dnbaIahK+DaM
         T0NAEGe/UFqWlReJ0Wr0DG7jzSaCAsNBo4BeoVOE9Alzq+M8RY90tO/7BhQgk6T+ezZf
         w5bt8Zruh2/DCR55w4X6s9Kuxvj1qiQl9ju6dVetvmkd04IWrBm3cCE46s0DCuY4WK7R
         FHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759435850; x=1760040650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yptgqm0jFxFfgcs9+GgM4ctol149fL7+2Ynqpr6fO9I=;
        b=VnKE6gDV4XQGwb112qp7fZglv7rb7Lp0/TWaQ+YxmP6qtAFYRF4fJxAhFkePkFFYpV
         WRXmPtatLDgHS7Zqbg/JPcThyRSb5g4mHZnv2XDP+3Ryrd+/aAQVS4/L8/HzpDZRqMDX
         QrBjIiLQ12lOdKRRJYh826hvIkVOlTC2SufPKG+1DrSfUEJvokwh/xgrx2NaYx9oKSRt
         WeAEDhVFN/reLF6SGhT0P3mIOs6AbMEsKVnD9WkTtvHXprIxg0UGqWGShXbF2VtMtnEO
         vERumeyHII8sL3ltpHZGAYeOhvxSexvN18S5+ttby3rg1W8KsdoPebLl29G5/+MDiX6z
         tssA==
X-Gm-Message-State: AOJu0YzCT02Yg0Lcm3wpFdFroVvUIKmtGbToGSwoq2dGR+hKFs+bZ+/K
	JbOY0tPSGA+G2jAYvL8UJB5MK+pVeBOPN7JJhOZMF7Rx338OvPHSqTWfQ9pES8uQAsi0HVYuLnR
	Y01AD
X-Gm-Gg: ASbGncvG6O/Dx8eE8MtpiZm5EG8HlolQxXfn/U8rPGpdai5LnAEWOtZ9tNysBTMnJzX
	sVcU9Fmp/Qvs92ye++jyk6A6R/5RcbuzpwjYp1Ur1f8HbZFG79BVSGZxyQ883iIaRm+uAZLJJQC
	or+GmI/ae4/Jg2HyxB7P4pnP+NkObmqaCWA+yagrIpWAw4+iEbVUd0b2nS60A7omqj5yEOroBC+
	X0AauBxbcJCiF+rB4YJ+ODDYOcCbClj6zj5YL0r6mGSmg3UF1Uqn5uJI1AyRQhIAfcYPmVI2LKI
	05aWmpU49xrFOKaZm/NJohSytspFjygmHYeGb0GDDKK/lFMYU/hWXxXNJJnt9XlbweVnUh7iI1J
	NawB3Whr3cWMjLjv/vj/2fAO2jofHiTLrabtWZ9fzNecRQNveY/GL0HCt
X-Google-Smtp-Source: AGHT+IE7dbQ2YJJtBusQReNmzOLhkJe7Eza2TAVuEVEFU5ygi7MTATEf1xBmhUoH73Id6fwCGteMrw==
X-Received: by 2002:a05:600c:3542:b0:45b:7e86:7378 with SMTP id 5b1f17b1804b1-46e7115d0e0mr3297535e9.34.1759435849972;
        Thu, 02 Oct 2025 13:10:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e693bcc93sm48017395e9.13.2025.10.02.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:10:49 -0700 (PDT)
Date: Thu, 2 Oct 2025 23:10:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 2
Message-ID: <aN7cRUOxq-zwCoZN@stanley.mountain>
References: <aN6qWFc6hIcbRU1o@sirena.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN6qWFc6hIcbRU1o@sirena.org.uk>

Rust is broken on today's linux-next (next-20251002) on Debian forky/sid.

regards,
dan carpenter

$ make -j32
  SYNC    include/config/auto.conf
  HOSTCC  scripts/basic/fixdep
  CALL    scripts/checksyscalls.sh
  RUSTC L rust/core.o
error: cannot find a built-in macro with name `define_opaque`
    --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
     |
1757 | /     pub macro define_opaque($($tt:tt)*) {
1758 | |         /* compiler built-in */
1759 | |     }
     | |_____^

error: attributes starting with `rustc` are reserved for use by the `rustc` compiler
    --> /usr/lib/rustlib/src/rust/library/core/src/pin.rs:1946:28
     |
1946 | #[cfg_attr(not(bootstrap), rustc_macro_edition_2021)]
     |                            ^^^^^^^^^^^^^^^^^^^^^^^^

error: cannot find attribute `rustc_macro_edition_2021` in this scope
    --> /usr/lib/rustlib/src/rust/library/core/src/pin.rs:1946:28
     |
1946 | #[cfg_attr(not(bootstrap), rustc_macro_edition_2021)]
     |                            ^^^^^^^^^^^^^^^^^^^^^^^^

error[E0522]: definition of an unknown lang item: `use_cloned`
   --> /usr/lib/rustlib/src/rust/library/core/src/clone.rs:219:28
    |
219 | #[cfg_attr(not(bootstrap), lang = "use_cloned")]
    |                            ^^^^^^^^^^^^^^^^^^^ definition of unknown lang item `use_cloned`

error[E0522]: definition of an unknown lang item: `RangeMin`
  --> /usr/lib/rustlib/src/rust/library/core/src/pat.rs:28:32
   |
28 |     #[cfg_attr(not(bootstrap), lang = "RangeMin")]
   |                                ^^^^^^^^^^^^^^^^^ definition of unknown lang item `RangeMin`

error[E0522]: definition of an unknown lang item: `RangeMax`
  --> /usr/lib/rustlib/src/rust/library/core/src/pat.rs:32:32
   |
32 |     #[cfg_attr(not(bootstrap), lang = "RangeMax")]
   |                                ^^^^^^^^^^^^^^^^^ definition of unknown lang item `RangeMax`

error[E0522]: definition of an unknown lang item: `RangeSub`
  --> /usr/lib/rustlib/src/rust/library/core/src/pat.rs:36:32
   |
36 |     #[cfg_attr(not(bootstrap), lang = "RangeSub")]
   |                                ^^^^^^^^^^^^^^^^^ definition of unknown lang item `RangeSub`

error: requires `format_alignment` lang_item
   --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:623:24
    |
623 |         $dst.write_fmt($crate::format_args!($($arg)*))
    |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
   ::: /usr/lib/rustlib/src/rust/library/core/src/any.rs:790:13
    |
790 |             write!(f, "TypeId({:#034x})", self.as_u128())?;
    |             --------------------------------------------- in this macro invocation
    |
    = note: this error originates in the macro `$crate::format_args` which comes from the expansion of the macro `write` (in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 8 previous errors

For more information about this error, try `rustc --explain E0522`.
make[2]: *** [rust/Makefile:507: rust/core.o] Error 1
make[1]: *** [/home/dcarpenter/progs/kernel/trees/Makefile:1286: prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2

