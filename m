Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D11E51EF
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315876; cv=none; b=oQ19wY80nB2VlssTBVTUvJU4VgyDrgk+bY75ALjpqkCrtTlTF3ZmW9nvqm0LVwX5YNniVuZ4lV08QyqGvYIlBVjwbyTBj9ytKlZeS5FKBPY2N6vHMUpicsGUSgwYEF0IFFk/HnFcs9pEJA0bquiU5Nzh+yGltyWx8VGcZhG+wFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315876; c=relaxed/simple;
	bh=Or1YtCo1m/YUhX9dpsqsIrPaYwB+P2dq/LEd0lL+/Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDhY8YvYorZ8RSr/YRcXe21PoC2EDKi2sun8/oX/a7FuzTk+uUgETHzOsOeZcOiHhdLv+wY7RMVA/8KlNKVNSUoyVO5HHwk/x0xrTHxkd9QYF8wZ4Cvk8gv+I/IYl3mMqj+ODlehT7fFBVO60YqLO6AO26B3OYF15YO43Q87D6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zBpxi8j+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zBpxi8j+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c854b6459fso54244f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756315873; x=1756920673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or1YtCo1m/YUhX9dpsqsIrPaYwB+P2dq/LEd0lL+/Wg=;
        b=zBpxi8j+8x96oi0aPWc0G7yLKVPOJKslX1cYJGGulQPHWihBJYe3UK3FfCBkFez9ZN
         ONuK5ZasTtZrgcs9byT8feQBoOvBOLsWZ2lNxByjbr4wbNfVgvXUo3hGLdP309X43MNo
         uG8T1Zh8ExMEc3HpQYjecM2Nmp8+mP80axT4g9OftTXVe51cSeCLjKqYDsIlDvIrK8fT
         4dAZUvK7vZ0X8W1WVXzAfvnMh4N0Ko4NsO0BynO8SlGa+J/Rxom7wTe5t7o54+dzrXOm
         99ARNpktjTz3QS/tJ7EhleUs7SznETOp7LBCm7C3Mtll8WJPRmESNI8eBDovNwkrW7bF
         x6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756315873; x=1756920673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Or1YtCo1m/YUhX9dpsqsIrPaYwB+P2dq/LEd0lL+/Wg=;
        b=hxTN4ofRIXwH6LCxoV0kPgEW5PrrgK6jQI6gwLRkfjZcc+GR2csS9h+nH4fkur9Uog
         FDdMV3f63Izc0a5WU4VuU5oCBed2IPvj3SUcVxe/MOLORBJRK1vdhOoEYI01rNuf7geJ
         659umSOpdZDQPc2F/P/jv53N7RDLjJUKsKDVCECCijx8lBrygyfGCKkbCygxe7uTrLo1
         dZpeIBYKO4UQuJr2KrgYSmJYVcKOi88r7rphCs5iQHs/m/0c8xwQfp5ZOUUDT4PDYlVs
         PUH6B27MQdXsBH9JxbXkjAse+WVHx7W1E+e4qDf3MRAN7r76EiZe9uNka/HLWf3IgRuW
         /kxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAEtcS6Tcf3HIfKMxHGg8toZEI+Y9478dHme4ScQE7GYoLYeqIoPTyCRv0zW4deFKbmyLeyfHsnioLG0jTEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7F7rv6nARmRpBzH1ooUHIP5Svdwvyucm77T0Y19SYJYeJ3bnn
	CzecP4Hrve498qPXk/f9R1VE6JTlrC5PfSN9YZXRf5JAyVU3YRxy0Y3L++6Wsw87tFSp4FG0hvY
	WpygC48OFQUmjhsQbWl/XZKtbYERy/1Bnqnq5uuGx
X-Gm-Gg: ASbGnctKD6TCFayGIJ55g6WCfCZlzxJM+FNviJXDMcydhpjaX2K75ptttQlngfYCkU0
	B1MsdSYOCUaIvNyWfz3MBuZeLZe0F0voG906kVHl0Qe7CVUmlGRjqANk4zRJfcaRFcN0DJ51pHa
	UYhCaPRmYgPes9KxxChY/trEOmi9VJaG+uFO99SZhOxu00WiAVheHp2gsOlTnii3951y/BVgR61
	29Luqcc0WKtu8lVBPxeh2oBQi987Xfu5GR9d8+96RWUKAg=
X-Google-Smtp-Source: AGHT+IGc7d8Pq14S2SYlUEH3xU20sRWuSFJKCdfeEnTmu9D/gpsBAVtTzNJTf3E/dhzYSTnSXR1XNWNmY9g2cqBDGtk=
X-Received: by 2002:a05:6000:2f81:b0:3c9:24f5:4711 with SMTP id
 ffacd0b85a97d-3c924f54bb0mr9843614f8f.43.1756315872503; Wed, 27 Aug 2025
 10:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814093046.2071971-1-lossin@kernel.org> <20250814093046.2071971-3-lossin@kernel.org>
In-Reply-To: <20250814093046.2071971-3-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Aug 2025 19:30:59 +0200
X-Gm-Features: Ac12FXzOvTF883WqSz8gINB3T0AfVGe4A5ccB0Utfotj0gCC-lsWQgkVt0ROKd8
Message-ID: <CAH5fLggOfOFj+v5vhmF0m9VhBUeegAT7Y8NR3++04LKsBrJPEA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] rust: derive `Zeroable` for all structs & unions
 generated by bindgen where possible
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:31=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Using the `--with-derive-custom-{struct,union}` option of bindgen, add
> `#[derive(MaybeZeroable)]` to every struct & union. This makes those
> types implement `Zeroable` if all their fields implement it.
>
> Sadly bindgen doesn't add custom derives to the `__BindgenBitfieldUnit`
> struct. So manually implement `Zeroable` for that.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
