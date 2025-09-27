Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A52DF706
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Sep 2025 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975276; cv=none; b=SljDtEEgPvoDJFWCNSev9n5V6+iXRnkEtJZeRvnRvbTukGJpgzqAejVybqkjGmDzfDxHaLPKLuI/+VXha5k1lpabYhdKmLRPqHDMd1fYst/0vwBKIqh8xto1VA+LVUvbrWt/y4XRf5CffPrCI86NOwm/WSf9b6ZBpVUq09kV2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975276; c=relaxed/simple;
	bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzpZdGNFZItJa/UcUkdwmyCmPPgu5d3VMwiJJUuE5HF5KotmGSeV+JNgt/2wcfeeBXg/OptLnGPri4w/apqMnAv1cRLV04/DfgdVIBHsJ7jb09lvngsUzIMBbXdLvlvtIFTLHx+Zpw8TpzMMXBM5qqWm0Q05fEvzCpI6g0o6b/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFQZxeZ4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFQZxeZ4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27ec3db6131so6062035ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Sep 2025 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758975274; x=1759580074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
        b=TFQZxeZ4uOCEM8UibUQWNPACJ9P5ukHSppEoujhdZnKDqlcFVNSN4vFPVMYEAzgJXg
         izt8EAG2uKETaBkQtv6jxxJFxiv+JO+2X/ZKTTvxD+opvXQUFXkVAx7SKedDc0WgMmrK
         bOsFrt2NLTdLQ262lIMJ7XL5E9ozW4p1vn4nxjl4jX9nmBU8oX63DESNtU8WSBpp5dxc
         dZf4g1tCozA5EoZV2KSHthhVQMLRJaWK5yLTxlOO5LKwoSZNQrVZlmR0IGTOLTY/D4ad
         BQviRptzQU08vrYVb99x84QLaEZJagvhdC3EeCjbPoaNU9B+EJfnGYy1IVPkilO5nOPl
         Wh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975274; x=1759580074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
        b=vez7BAbzIe6NEDb+pQ35h9cRAGwJmjIbLkdU/Z0g4ZBaRN/i0+8798Rk2aW+HFy8su
         6m11M9UhZasnn5wI4HDEyVOBm87xtFUW5JhemzrG1hEU/MFjmEFNt5WOa9uU4k3TIL2y
         rBgkZjMPMgO8F6K9LnPnDtVtATpQWUJWKl2KKxia4lI40YwuCe2255dHdbloWTs5rugz
         QiH3OUysxMVrINUTsiSblUEU1WMBTC2qlsTR1etOpH71NOguC37YzyE1A9qZXRdwmk7b
         dJOb0T5dAgnqvfC/JZN9oFqTm92vJmm5QBZeXlb3gt9+zpzkk6NDQuFGr0IwqiANz786
         ZPpg==
X-Forwarded-Encrypted: i=1; AJvYcCWQqwD15xTc0kG7vSIWDrPS5cnoAgf937DRBgmRGcSfoCf6s4tVPscYJMRyFsNJpdfdmk6XtJGtC/yU+JE04g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/6AwIdy3lrNIwcbeTJZx12CpbtzdRXsx0rv0A2/DyQpPzAoq
	Jb9LE1iCT71qo1/96vEyBErNdBbmUVCbyz/8TY0Mr9SVhpx1D82/7tf0HYRBmbDIrINFxQS+m2M
	bcxmZFIkmM7egrwEy8sAMhJ3Umvd+Oxw=
X-Gm-Gg: ASbGncv35py6sTr0on8POajUqBuzakHS2vcQxawmEaUH7vf3OCsa4hBxwTwdK4jDpZY
	MoFY+fdKW7aqaLNOj+G9xAOLOxVbi3ElC//+IHl4761a3PNHQBuO/Zd3Aawy8h7r3Bg0S7V8Z5b
	YbYDmMtwsyJYmyDrIxVCnOHDu+50ub3uWTsi8+M3WSsnSXKucKirTfvf8/14bjuZlAM0OvjTuCw
	gjPqkUW1V99LTuupQKikQvuE1HMmW1l9mcYOle+3MSKs1DcN2tjvJAQpkSq8z4e4ZXEz/WEHSEp
	hB3sHDB/odPB7Cjx8AWW4/OYSPik8ATdtuQi
X-Google-Smtp-Source: AGHT+IHZjp/EfiazAV4KIr6CKQXQ4M+vN6ByhlopidH8GmTXvgth0071YPgESmpcClrC9cwMbzePH8Og+U45ZvhzRpU=
X-Received: by 2002:a17:902:db11:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-27ed4aca4a5mr73015705ad.11.1758975274365; Sat, 27 Sep 2025
 05:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918123100.124738-2-phasta@kernel.org> <aNa7BDpKS2KA__4M@tardis.local>
In-Reply-To: <aNa7BDpKS2KA__4M@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Sep 2025 14:14:22 +0200
X-Gm-Features: AS18NWCd0oDH3VKEokXgs76roViozK_Ajh78YilTwKiHy-TyrYWiBu0MM9gxng4
Message-ID: <CANiq72=6pGtKKr3XeZXLVrJTNMv7YbGzbezSUrZ7A43MJQLwJg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Lyude Paul <lyude@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 6:10=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

Either way sounds OK.

More generally, one thing to consider nowadays is whether we will want
something to eventually live in its own crate etc., but for this I
don't think it applies and being in the `kernel` crate is fine.

By the way, should Gustavo and -media be Cc'd?

Thanks!

Cheers,
Miguel
