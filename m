Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2450917E8E4
	for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 00:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943106; cv=none; b=pMAzfCxgQZvhTpig3Pa75s6CdHM1rGD3HFf3hhzy8dkz2PVjnzP7RRs/U5l/cxR0H4h2oeKmMJBbEwk3mOKxhFhJZ6+/tFtqhRS9OdbMVCjqjcf1L5j/v88B5wzkHYJviA+RM5DPDoegRF3IRznf46efzkOLunP+OM3AlPn9Ybo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943106; c=relaxed/simple;
	bh=OsiL36mODlI+/Ve7/jKMRwzBlRNk/fmzjF/O9A5DVFM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nXHVQgVN3D0Jj62uyJoC4dFRyTJsXu3ZhedsBvZ9o4dPrwE5fZppm19t8iE43GjHfp9BquF3jeMv0/hyIf1IiHKhBwm5t3MeDYOYYpjD40dZaaiBRxismT3/oIGRQFoiRl9Vsc/qCz/gOS0KvC+yvTgU2oGrYtWwwhLhLMRcMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDrAD/p1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDrAD/p1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f8e9876117so86331b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 17:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716943104; x=1717547904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXVj8Lz7S+dZA6aK/WZF+OYv3CYCpUwdY8awKL9dIMo=;
        b=FDrAD/p1zThMuG/q1TgL2Bm9Uoebu86Zx7Bj+hp7UUY3nZR+lYPx1saB49CR4MBnVP
         0w8oDjoWbASfFc2wo/ygQ3YDIGNCUjx/DsB2P7AudJrPHI2kLo6TZ1bJxd1kT1roNCob
         ut9SuDg5XeY0w8wUG+QpNF3r/wa3L8cRFWppBlzy1g47MLCtgI5QnxziRdx1lvypSHPj
         ykbTxaW11BffaeSfsHoA1ZeOBHAMxxTagP8Zl7Uzx37zEgllRFcp35TDKFz7cWXagAfp
         NwnNvvnyE86kU67Ew9LNYskT/NP95jZAkeJpdMkDtxARvhnfJolRRiHt4DBm1gX69Ilu
         wHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716943104; x=1717547904;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NXVj8Lz7S+dZA6aK/WZF+OYv3CYCpUwdY8awKL9dIMo=;
        b=fTvsDKBPUO2/0tcq7gkUPjQkGU+6waXLS7S7esyI8rpjvQ6+ZktSIf8uAIo30fiG79
         +hd8lDLnMYye1U0C7Ft6riBc4s4q5Rt2pny1pLMWvoOKbvUR6UsUvJce32zFf7fj/W1G
         61l2j8AktwL0c8VZzmbvB5z4iZR7xVh6VByNKWgywlGjrDJit1qs3XrOEKdbHt0HndoE
         Or4fqi8XDFYPgOUB55sFJDczYJQacmo/sAn944KVc4DxGfjR/ZkXfGHmXlf/sybyiIxE
         pDDnCjJeykTnLWt00GJnUWWeU6Pww42PxvzlThvX6oZkxmYftcCoA3ppSx7DLB9CYd4X
         n+zw==
X-Forwarded-Encrypted: i=1; AJvYcCVwiWCKHs4s46vILqaiCMSCQn6EXsF/ukbJVfNRxWBQbLHvBAH9zletVjjJoQkkgVpr7MkNlWcp71b3P/Q5RJmOBr54DfuBVEGa/R+C3+g=
X-Gm-Message-State: AOJu0YxhQAUrWW/dZtrb+nEW8k4uEZfzdPzhZVbeGKLLIyL8ndOg8nvj
	9KXN59LkE0xyfdseZKMWfhoaNYeioZb1Twq3knOI//RbyavOn2jE
X-Google-Smtp-Source: AGHT+IHnRbFd/HcZToBN+NtwDm3bF7eGrnVJi0st8rcdgnVNQz+KSvYbYCcRuBFxCw9yvzDZ1XumdA==
X-Received: by 2002:a05:6a00:38cc:b0:6ea:8604:cb1d with SMTP id d2e1a72fcca58-6f8f1a652eamr14543663b3a.0.1716943104282;
        Tue, 28 May 2024 17:38:24 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d51b9sm7001352b3a.188.2024.05.28.17.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:38:23 -0700 (PDT)
Date: Wed, 29 May 2024 09:38:07 +0900 (JST)
Message-Id: <20240529.093807.2141781600641468523.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZlXLzCYiwdMxic3X@pollux>
References: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
	<20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
	<ZlXLzCYiwdMxic3X@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 28 May 2024 14:19:24 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Tue, May 28, 2024 at 08:01:26PM +0900, FUJITA Tomonori wrote:
>> On Mon, 27 May 2024 21:22:47 +0200
>> Danilo Krummrich <dakr@redhat.com> wrote:
>> 
>> >> > +/// Abstraction around a C firmware struct.
>> >> > +///
>> >> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
>> >> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
>> >> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
>> >> > +/// firmware is released once [`Firmware`] is dropped.
>> >> > +///
>> >> > +/// # Examples
>> >> > +///
>> >> > +/// ```
>> >> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
>> >> > +/// driver_load_firmware(fw.data());
>> >> > +/// ```
>> >> > +pub struct Firmware(Opaque<*const bindings::firmware>);
>> >> 
>> >> Wrapping a raw pointer is not the intended use of Qpaque type?
>> >> 
>> > 
>> > Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
>> > the boilerplate in the 'request' functions to some common 'request_internal' one.
>> 
>> You might need to add 'Invariants' comment on Firmware struct.
> 
> Which ones do you think should be documented?

Something like the comment for struct Page looks fine to me. But the
Rust reviewers might have a different opinion.

/// The pointer is valid, and has ownership over the page.
