Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADB5421F0E
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079954; cv=pass; b=MfPZ+bY5uRU8NW8MuTAUskaEX+CBzmnvu+bs9wPE9xr6snZR6CaHm2oKD5GgOBtp690wBlJGnJC28mIDIXiEhzmc9Mg17KKGx6WtmdGOIMlRmxHFcKBoQWNcXjZet36W307aLChqB1I8cQa/QeM5kPWTFPAPpwBT5WeE+dqlIyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079954; c=relaxed/simple;
	bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3wSx60Z3qGe9DbhO4PNZnJqV73JULgqI168vY1LwjkKNxTfWFoghxr0ULT/MWDQ4w4eygZsM4hsK6n1PR27XdfX/agfbPQUn+yJh4r5LlTA2Iq+s/X/MhWj4LnuZoTSsLzEFwfMQPaSqbK4lnB2a0Pso0atHdsDBUWlXQFur1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHHZRjcE; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHHZRjcE"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69de16f5f79so1669892eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 11:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780079952; cv=none;
        d=google.com; s=arc-20240605;
        b=Quw4ZawJ3Yov+zAIWq75LW/9F/EjYOakGrxilTgFqE12iJzV6lgMPMY/uFOc0eoo3x
         Twy7u37dnSLVoNJ54arjDmgpbP5jZAtstUENqAdDC7RB4kUeSGs3wB3GpzlGHr34xFLn
         tb+nVbES8jKbpe/O5QxkgrQJ6iE10CV7we8L/Ohj00C+2BHFngQFZH1v3CsVuaBIhiUF
         uCZWh+/I6AZFAR42R+F/6KIZ1pAomzgP5tfLL/XskDkewRwBccLpZUdxI1n3g8VSBI9v
         WJWQGXSKVMleVUbQsrWiMLLxdY1YeIwbq7oz2ebRuVOoyqOsN/gy6WNwmoROXLeZvuA8
         84LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
        fh=YoAp9iesw3XfH1aeT3+f6Rb5qdy6/LGYvZZC6tayNoE=;
        b=c7n6cXykRjmxF9Wz/JGbqsgNXsv+ag6zKJsKDWo2HtrTCQXswoYkilQ81RaJUIUwuc
         pDzf4D/j5zLdCDCaON91RvXZLctq3CXhFASZPQdKltxaaiIcxu8g6W9SJJKhTfYWJUZ1
         ngV87aUdwJgpZFQuUbDum6OwoOqZI4T7VO12WE7qV2udGqHHmQmx/BxDJOwAuULeo2z/
         bg0TmnZQvx9d9whKlE/7UDPTuss74H8c3EPe+xySVbLAOClH4Y0FVhve2KwMxszk/fHk
         2QlPd/hleJVY/H1MYsuVmfu6CY5sbXBYrjqPYgReHbb72bswAli5x/nJ1YUeeXgrK2ZN
         jD+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780079952; x=1780684752; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
        b=OHHZRjcEc/quHl4uxz1UOw5yOuDBoAZSucl+vkBZ+Dg/MyzVty83u8E5xCqBkAf09O
         TJUhIIMvZFtlpn3LsFQUmvAe5CAmu2jBNKBdyqU66u6RgnWvVeE2tizl4TciMTsf4Nsr
         yfXazLNuyb+8NR0yxOMTOWELGQ1iVUEPREEQKbIjfwUCrpJYSMmworlRC4DAYpSRyL8n
         /ddc/9uAfsr4sbueZ7gpDdUIzXdfLTIOt55yBpoMWJ6xXYbjCsGAHb5vjQT4gOQzb1EA
         y43HTleoUzxseBQiWjFwHo4VoKftycbw+QRDR/WVtbJJIhbaYok5rEhWWNpD3voEBBu0
         iB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780079952; x=1780684752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
        b=EK8L53bWdXIUWdzyY7ilJHlW1JOcmAGappfOulgwRMQI5uWooya2A5XK4DpCQPONgS
         +UoXJuJWHKeUhopJGBwst6CK8gYGQca/C+HyTye5JbFo89PLa37nYS4tIuBjfo5KJDvV
         tpUkuj6sMilkCfTAi6IUNyz+2tSxcIydER6QoCqpNZHkaxsSl3/wbXg007yXRoZU1rOO
         oGS56bRdK8AwiNda+1jLlW9LJ+j6ODr6g1tW2+68Ltut7H1Csq5hLAqwOrNhhGlpLY74
         MOJG1SXDd6QUgEQDFAudtw618vUQqRsLTLVUjP24lZQHnyywdqzt0yG0CKdCNygTKQiX
         mKNg==
X-Forwarded-Encrypted: i=1; AFNElJ8QDWohCLAfBBiDDPQcFcGFlV35oGC72gF8dyXyATQYS+mrou3Uw9gMK6MjYstS1jNOofY8iqhBnDkboB4uFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa58jAUoyWiO2hY7bjQdtbGQnTndIKt8kg6/rb2eJ+Of9J70pi
	zUTNPgtNAOLbArXsgn65lco0Up8TsrZ76Kzt4ypGjZPyIlPc9Oc363e+r/3av7/mpb465Za0kFT
	zRA86JHQLBDq7Z/ajHDwDX7iZmW8yQkk=
X-Gm-Gg: Acq92OHGfShDRClzCDXZ5/cuwFVxFhvGUlYXrGjpfLFen0h98T0mECxlQruiqwHsuFl
	kLmi64XfWjGNTEHOnt9Krnezxk+L1a5wi6imQNrtJdgT86clhIwpXyaHDAFWaC6XojfwS8W6m9R
	U40Ol8IfkFlpXp3s+uM9AuTiq0ZW3Qlb/OnnnLpmz1k7yuIFrjAGdPxm9foWAX9+v2/ybVd7wUP
	PfFb6W8DnKP1+aMrEW5CZ6/wxuqv9JdHzht5df0sakdw7aAcCSyXA634IbcYwcnCkUIRN7lc928
	vbQLCbC6Jt15EwgroVTh3/gC2S11WA+Rjmi/LTT+o4n2tSF75N8=
X-Received: by 2002:a05:6820:138b:b0:69d:ee54:babb with SMTP id
 006d021491bc7-69e103ca290mr283652eaf.46.1780079952121; Fri, 29 May 2026
 11:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org>
 <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org>
 <CAGSQo03Fv_qqGTxugL1eddby4wfiUm9MHevnNxyg1dVXAfCA4Q@mail.gmail.com> <CAJ-ks9mzqO3cOwEMCYb53C=CxiAD-Jfq=o9Et4XcFii7v2zW9A@mail.gmail.com>
In-Reply-To: <CAJ-ks9mzqO3cOwEMCYb53C=CxiAD-Jfq=o9Et4XcFii7v2zW9A@mail.gmail.com>
From: Matthew Maurer <matthew.r.maurer@gmail.com>
Date: Fri, 29 May 2026 11:39:00 -0700
X-Gm-Features: AVHnY4Kv5gnqWuRInUrrkAfi_PifvFJvoGmR1cT7xJSJb1knvtlkvtn5ZxIRATQ
Message-ID: <CAM22NNB5EFDOFWe=_WftgkzcmXQAWRUHKYDcuDZPagWt6_y61w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: debugfs: avoid transmuting FileOps
To: Tamir Duberstein <tamird@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> The approach I have currently is to use debugfs auxiliary data to retain
> the actual callback references. `FileOps` becomes parameterized by both
> the backing data type and the auxiliary data type, and callback
> operations recover their callback value through `debugfs_get_aux()`.
>
> This is not API-neutral. Debugfs exposes one auxiliary pointer, so a
> read-write callback file needs one object containing both retained
> callback references. In the version I have now,
> `read_write_callback_file()` takes a `&'static ReadWriteCallbacks<F, W>`
> instead of two separate callback references. There are no in-tree users
> of that API, but it is still a visible change and may be the wrong
> tradeoff.
>
> Does this seem like a reasonable direction?
>
> Thanks,
> Tamir
>

My first choice would be to just add #[repr(C)], which I believe makes
it safe - having an instance of one of the various structs carries
proof that its callback existed as of creation time, and so the type
is inhabited. We could add an unsafe constructor to make that clearer
if it's not clear as-is. This is an invariant on object existence
(which can be managed dynamically) rather than type existence, which
must be managed statically.

If we want to move to using auxdata, we should move all the way to
auxdata - don't materialize zsts anymore, call the callbacks stored in
the auxdata. You can also convert to function pointers in this case,
because the only reason we were using `F: impl Fn()` was to leverage
the singleton, which shouldn't be necessary anymore, and should
simplify the code.
