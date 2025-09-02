Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CBD2E7BAD
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799614; cv=none; b=AiWEQ96zPKSHkIJNsjOdFbQQ3zOwnpZ/0Exl1AowDutpSEQrpLvcMz7PsP7EFeLoH4XkFbK9JnwxLnxO54AywoaT0U/PQKz7N/YVgx+jSlo5h8z3WHGKv0xe6O4vwzt6jaUJdYB0/+2TY8T8t1s10aGknftKqMAVT/jtB4Dy4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799614; c=relaxed/simple;
	bh=L8ue9J2vi2pjgMfgSyWzh7k6KFpTN86oCkpQ3AgDGUY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i28KBqRWB+GuL5/aM5KEoxEXrXLoTsptjjLAaDIwQY3GRpOH6FF7n+SIW+6OlUboJViQAq6IWuLoWOvKpDkolVth98RGH7nPr5kynwdkAQBDoo7zQhL9RqDVQ+gFuRMtRt6xnM49n6oZm7kRGCDXiNNcIf4O2vzYGnjlWIOUpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zKWMr3Ns; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zKWMr3Ns"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b80aecb97so33849035e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756799611; x=1757404411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UX/i8pzWZiHBkXFSxW4oFkcmw7w7tGzt3veZuRyONCs=;
        b=zKWMr3NsG5/3GCK4a6V+eO2BtvQxlaXT5jCUGBvD5595zQFfb+SDuXlBJkjiY79uAZ
         v53TI8QI8PEDgCAtP4Sqj3GvkoeAops2H2OGr7hD9uMmpC5TMWFjCqmZqOi5zoWpwkcu
         a8foElgB9dQ6SCtv31Jpt70UPWVJM53ALHWIDFic4JVLnLVcSFyv125DoXdsWRVUto3C
         q1Ux+7GyZ1xxs7g2t+UZIgk/XWBpIk/QbpIAC2BtEiPZAnuag5FOM9njJiaIvfeRXjof
         fTOMgrtoPuPUpadTGjNj2ypO3pd2qghndtCsgY5p8iMGXmSql58n2zB4EBQ5wACq2HcI
         oSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799611; x=1757404411;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UX/i8pzWZiHBkXFSxW4oFkcmw7w7tGzt3veZuRyONCs=;
        b=bJrkvwNClm4x6UQX+T2L7Gf9XD5p+TsM6QJj8IkqLZuYbCgmvYlufTQFg70rzrLF+k
         SJXcz6GXcHwihKYtz7hFUBLQFZ1kjOxtIhzk3OdfYmSBvGpsTBTsh9wZ503ndv9zxHoi
         aqgQLMT4eGgtNdt+3+UlM6IjwO/fxZAuCbgXos4mto2y5qMV2MfmXr2s+WJm3SQu3dGF
         n18nQROERS6KnDP/vrSVy++82S3pEEQ/QwNzACH2r8B6Bp6nDZ574/nVm2icS07lycj/
         ahL2cELiiLFpH0ub4F6Z0Zi7kTUn98XR16yWqgDENPFZZ21fxYItWJ4LHOVUOkoekDUL
         sbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvDIr7diY92fh+Fz2JKktmrX1WzGoJYA/Ohc0UgxC5KEuWSA/ZevrdIH0q83V43IsFO7jgTOfXBZUWL4t1aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGTK1qO4WgDhyPa/juZMBB4AaNwB3Iuqm8Ylx69kKlgNerUVtY
	o7rDyJUhSypm91nc69pV4Q/4MVU7ywl2yy24s/fR6msWeYS2lX/FbWC4xQVrzEGbZzk49ux9TT/
	SA92i6OYp/+oXKUKY9A==
X-Google-Smtp-Source: AGHT+IHRufGwFNMIvt/T3xJQqvQe4WFWXNq8a8WfNU6rCVwIEubSuGF/2DraRjnBtfk32fnbTi4quo01Nalys2o=
X-Received: from wmsp6.prod.google.com ([2002:a05:600c:1d86:b0:45b:9a77:6f95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3145:b0:45b:7aae:7a92 with SMTP id 5b1f17b1804b1-45b85570838mr83318775e9.21.1756799610677;
 Tue, 02 Sep 2025 00:53:30 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:53:29 +0000
In-Reply-To: <20250829-regulator-remove-dynamic-v1-1-deb59205e8e9@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250829-regulator-remove-dynamic-v1-0-deb59205e8e9@collabora.com>
 <20250829-regulator-remove-dynamic-v1-1-deb59205e8e9@collabora.com>
Message-ID: <aLaieVp1U9JTTjP4@google.com>
Subject: Re: [PATCH 1/2] rust: regulator: remove Regulator<Dynamic>
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 29, 2025 at 06:11:31PM -0300, Daniel Almeida wrote:
> After some experimenting and further discussion, it is starting to look
> like Regulator<Dynamic> might be a footgun. It turns out that one can
> get the same behavior by correctly using just Regulator<Enabled> and
> Regulator<Disabled>, so there is no need to directly expose the manual
> refcounting ability of Regulator<Dynamic> to clients.
> 
> Remove it while we do not have any other users.
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
