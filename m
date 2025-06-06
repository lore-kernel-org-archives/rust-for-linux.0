Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B025F793
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200423; cv=none; b=TO7HSzhETecO1dQGxgq8oZawiL2v+3JUyeH82BGExL3zqLGP0Fb5sIiXUDUUGC22wrjHlQlJiwUoGFLNTjwsFyUZHadzsHmuO6N+LEh/+b0XWEuiPF0DRc+Cdrn9VGYnHSFHrWoNHeLTzWG3abtptLiYxEm3UHlMAN9PsSnH+H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200423; c=relaxed/simple;
	bh=/eAfRKkG8umOInYvuV8Ox5HGkToOXh0S4FrQTBYSvyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y5vfRgii0RgStxlxUAhJCy/rQCeowlLEND1b7MxN5PC/JI8VFy6kWzFEh75nEu6JPtz9orhM3easUR8Y8S3qA4xkW89OkuZavafY+3R50BnTR4Pa+mfpdErDoZRheFOwNlggsU4j8jNz4TL4H6aOo5lw5kZRmhKYEUnOjOw1WEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjREHAPf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjREHAPf"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so7317375e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Jun 2025 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749200419; x=1749805219; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PC5oMgoZ+UFSPHr55ppMv4d7kRuQFao40OCKHLwKl8=;
        b=JjREHAPfKYRGWGxqGODL4We4LZkBxVTp2vT/lu8JFm0oeYuiVyVCwnU/FWJFY/3ngw
         xxpdtorNYBP1MFgIUXclTVcWKCcxG4i1wYtiUK56dCgCVAe3GHHjnYCTTtohXfVaUHv1
         iqtBO5gByfdZvCTfNd5KUXum9IVIXIoM9hK8QNPkoKkVMcjRTPpF3g7arFlOOojx/Wj+
         9NaT42Xp7e8YCXPRBHMwyz6zakJmpb8ORrEXREgraHH5InfUqz4Ey3FoPX/z5r2GS6r3
         om6y2P67yRM6C4rKkI10dSFElAzJALRIh8rR+OfH7cRrdVcLeChxJsJFFuv7JGe5rF0Q
         yWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200419; x=1749805219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PC5oMgoZ+UFSPHr55ppMv4d7kRuQFao40OCKHLwKl8=;
        b=VNuvPi9zw2wmpSvXmE+8awCWw+87x28AS5zcJGh8Q2wtYocQDFat4n7HC0yj2R9UvP
         9Gw/j5NUSz+CueV4YsHVcEABQuGYcLtoJaH/4NeP/Le/T9HTeFw02ibGFN9k7+uXj34v
         f3GHsPfYAUhpzi7fRB1XQtr5RXflTdG5fcVFZjGyKSu88bSGT1qPeADusb0rAo7N+xxJ
         MceubkVzzsz3DwPUUxhmo9g6Wtj0qm7jeexCoVD/v11mdW+GTjDYmoBUCNTgWGiLYVO8
         hRoF4tQA2cO8lLddpFeBAnw8UoNOSgmuVWx8tbJw8THql5yUTe9R10YyEpsFdSmCpmjy
         239A==
X-Forwarded-Encrypted: i=1; AJvYcCXapiEBkbnnAy7uD3oMle87BtC69xn/Q6HUULiq3+UNwJvV7IvMKzFFM5g00xdq/oqtsYF42rlDzvhT1XwE8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLpuTimxzgZkG801TyVY/B5edjy7BGqreQsnvn9bPjWR/ofHg
	0keBTJL2EDU9REi5DY0F9wZKSYQrkR590/L1hrsDtc06FKGlyI46byXcZzvnRD04fNNA7eZ58Ga
	CRq2Cm3qIM9BPGL+mqw==
X-Google-Smtp-Source: AGHT+IH/QYbvsS/U9rVKnUtVrlndHv1MOMIqsNE73OS3DtORTGUsobRwG7K0tQKguV825pTOaG1xyT76+ZRfs+s=
X-Received: from wmsr2.prod.google.com ([2002:a05:600c:8b02:b0:450:da87:cebb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c177:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-45201417bfbmr24715585e9.1.1749200419659;
 Fri, 06 Jun 2025 02:00:19 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:00:17 +0000
In-Reply-To: <20250603205416.49281-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250603205416.49281-1-dakr@kernel.org> <20250603205416.49281-2-dakr@kernel.org>
Message-ID: <aEKuIRI6UvgCZ-z5@google.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 03, 2025 at 10:48:50PM +0200, Danilo Krummrich wrote:
> Implement a minimal abstraction for the completion synchronization
> primitive.
> 
> This initial abstraction only adds complete_all() and
> wait_for_completion(), since that is what is required for the subsequent
> Devres patch.
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
