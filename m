Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE263148BB
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178492; cv=none; b=n7GFKnIJbQSjLPl+8Sq2bf/tTg+3TzI55YDnZRwne0H/AcfGx1QOXDZj7EADG2jX659315Ef34msI07r2vSdsRgqDj35KTXoIRsRN1J3fEK2Mvj2L/tw8Vya+w2sIYTTtmXzpLHwoqZaA0hWGb134UOrJMtiiNXLH5NVds5okVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178492; c=relaxed/simple;
	bh=Nw+BJAMZ5h+EtGDaFI5skjXcA4sa2O4iNnNPhGfXgaQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=np0Ft6JWDWDM0aKg0EauqoRhcbtXkHVvrcFf+BQ6IZUjPsUBm8rjEGqMUf6ooKFMqc8/HWitMF5crnYKKJv76sKhc8U6w/+H1wmI9k/WQ5SijcEQfEFj7es+IpsGYVL4V0Oz6kxB6YiElurK1+5GQzUp+YcrXXo+hGBX1LZVJd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmGqDv/R; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmGqDv/R"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64b735f514dso13772788a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767178488; x=1767783288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19R6EJ3nmG8bH6g7HVYGBZVYUCY4528QFkI5oJNxaoA=;
        b=RmGqDv/R2T9qEmxiNUPFt7n7yD6ZTIOOPy1kiVKdKdohe9ZGi53bvmVVaXVs9OczVx
         tgNKoXPK6Gjd0wGo4UC8MjuoD1c3YpBIjIyISgjdyj5c+13z9XcIT6uvSAiZ5JGS8uis
         dpEQdi+ry6oWDs7SFTBKgnXsE/4gX0SVamFOpGVyaUEGatLY59knxzUXbn/Y+0rN/8to
         wPjYvX4UR9gXsa5O3fnuLvdYo959mnJHS7FvmIHJ9tRrnkOSgjdewpMPXhWoN6piWxYz
         ureCyhSjbgArJn8utbBEUSAnlvmmlpeuePMQy8hgSH+2+gXGKrYZhelKNv+elqLDWKZZ
         diug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178488; x=1767783288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19R6EJ3nmG8bH6g7HVYGBZVYUCY4528QFkI5oJNxaoA=;
        b=QU4l+oN288Bd4thpJN80lR7d8Ee+Ut18h7VDLp3pUMOJNzDt2/MVvs07T0iSBcv+tP
         it11gpynyNuvotzMZjYPPNMOCWlY+GhE+OeTBzO4XbSALLvtEe7afzQywU5k26Pg9FlI
         d1Z+iAWbqTRoaPzYHjOI9fQF/EkaO8+2J6ROBJL4FtfewjReNjzPnV/H/kBSSdfbZ7gq
         7mxXpS281MSpoeakjSY/A2uYJpRaQfkB9OQB8+30k+5Qc5EwuLjCECLUIINZ70vEepip
         7yVziD/5y+2tpkqvJ/QOVGzhjmQwLqSSlty0h29YjOHccE5YvVxcW6sOPtC+JkRj1B1s
         aOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMbPhFhBLaJyfA3SvJnsq0BP/SFYXBfyDV7hAgAA1RslN2D4G9yZYKhZeQ1xS2geVQuoK1yQpWVX2ucIanYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1a9zjnKO7JtzmSYa6yzhLZAqjZCepOHwvneaLR0jns5+j36aO
	cAF7WjMSxMqlzzyKuSg5sqNa2u7GnQCbl38aG6N1WMz2w8Ov2R8/1PYWi+lQt+S+4bRW1mqmNgU
	+L7RC8riOB1JviV1Ptw==
X-Google-Smtp-Source: AGHT+IGcdiS+n6OvN6vq4CxidN24HuvApIwP8v/wHvVylhSu7QqcGWdw4P7MtJ/H8CCxzlx+gzEgU67/6v1f0Vs=
X-Received: from edxs7.prod.google.com ([2002:a05:6402:1647:b0:64b:9d79:4970])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:90d:b0:64b:4037:6f5c with SMTP id 4fb4d7f45d1cf-64b8ec9d0f6mr36185513a12.19.1767178487840;
 Wed, 31 Dec 2025 02:54:47 -0800 (PST)
Date: Wed, 31 Dec 2025 10:54:47 +0000
In-Reply-To: <20251230093718.1852322-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com> <20251230093718.1852322-2-fujita.tomonori@gmail.com>
Message-ID: <aVUA9_qrqPHKcOLl@google.com>
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic primitives
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 30, 2025 at 06:37:16PM +0900, FUJITA Tomonori wrote:
> Convert uses of `AtomicBool` to `Atomic<bool>`.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

With the comment about i32 vs bool addressed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

