Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7392AF1D
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340761; cv=none; b=C9KIkEM2TUaKhLd9XAKjJQoQ2Gl7ejJ/gMnatOb1PTDmQ7UbX8Z8mFmLphJNZ9zg1IpQ1fys0ro6SeBFjjRB+7sb/vwKVkIcDCRJx2GSY6p+OWlfYMWFZ9N6BQR37x7Nvvvamt0zKx9NFpi745MKYXhMYKK3ZgXkBbWSIxJoU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340761; c=relaxed/simple;
	bh=aom4ik6NbQLJBpPAsZFZJSGuc3xewHhssefGt5HVSqA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j2SkFNS6VsPkX8k1kVqW+iPKM3xgaZCYLELW99gZF6diVtnPZEcQ6CtKW7Mrgo+qRQqvW1ZlImMchzpsAEIDqV5Afbtg1NWXawXxCb2qYZxAYLpviHn5z/a1J2WE97hmGFKnAfVbBt6ZmtCqdf+TT9Y0vhz9S7DlX9sTo7t1nZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ucw3yVGA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ucw3yVGA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45639e6a320so3484775e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753340758; x=1753945558; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E9slyRDPcGtY3E1cTdlfeJMl5k9N8J/CpAiLJlmmRwU=;
        b=Ucw3yVGAA53OsNVEE4JJB4/70u6a8Sq0bVMPZRFECIRbkAi2yh1asRQhRhrQ/JRsfA
         PqgVyJ2L7RJpncfAOBsz72pONAwd1ys9JTYKN+cRx3cv97CSRODk0GqF4+9ykIc5Tonp
         W0J7RdXs/231uoT6wQKobTnmoJW3VKlRQQ+pFFNa3o550/R/zp+mS/R6UT18pTKu5q1B
         i7X5dmFVi+Xrr5/X9YQ2c/5WwUJVQ9FQYrJzrPdp9T6/jmw018X8FIuLpb9PQ5loHEdC
         kxh8bqelJRV+HNtqpqy2L6gml9KJvHSowuEP1vxuHsiBz189QtVqA7uDYSk+0GY+RaZ6
         MEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340758; x=1753945558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9slyRDPcGtY3E1cTdlfeJMl5k9N8J/CpAiLJlmmRwU=;
        b=kmP3SIhrSc70/ynPDRIaQYoZWCboahoXdP2Jp3ivAzL8DdL93yWz1u0XP3083e8gjQ
         mTHT+ytRsV/zOFriEZnvaycoJrwf8bOMZzq5lPc6o3CGwI+4jWR72K5maGDtHm+ezArs
         +RrYipWCy8CM8c7HbgNezf8A+VRQY9ADtWDUoHErpuSvD1EqPc+HQa8JyKxmvcbxch4u
         qJzSUZZ+dj4gxN8Utlf0UFFmtXACG5qtO0bVdWV4L6oxYLVf6tGBgEsNYtn0ybpF6PUM
         S8BjAnWWO7+VBDVxeUi9r6VpQhnaEqy785TZ82m9wY+Nfn7eoDZ+BL3+PP67y10kM/pj
         bPXw==
X-Forwarded-Encrypted: i=1; AJvYcCVb4NCY0+Ua4DWit9p/dKeP5nFjtecaZxYzsSF7wf9beZxnZcXHdmGWOhPntWTkImCdZeBqUHdhJAeGzO6iiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/93U2xfhm29FHMyF74fDY5YgiSnT1q3nfX1knwPFgaUBSVQ7d
	k/xwsg4lMx4CBlvgoi70TOXagZfWiO+2l6c9lMQ2SiRqDWIi/cReRakLXosdJwzajFFyTZObcRP
	PKRJiDOaVCMLWZjFLuw==
X-Google-Smtp-Source: AGHT+IGyTjyBp4hfzmrFDQCSBkvhVeBIjabcRMfTMV10Ea44IJ7TP+ZbQw0R2vGl0rPk+/+EWHeAEtNqrbSrHOk=
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:442:dc75:51ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:d:b0:456:207e:fd83 with SMTP id 5b1f17b1804b1-45869ea827amr41426465e9.4.1753340758482;
 Thu, 24 Jul 2025 00:05:58 -0700 (PDT)
Date: Thu, 24 Jul 2025 07:05:57 +0000
In-Reply-To: <20250722150110.23565-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250722150110.23565-1-dakr@kernel.org> <20250722150110.23565-4-dakr@kernel.org>
Message-ID: <aIHbVWzX4NiZaQ7K@google.com>
Subject: Re: [PATCH v2 3/3] driver: rust: expand documentation for driver infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 22, 2025 at 05:00:01PM +0200, Danilo Krummrich wrote:
> Add documentation about generic driver infrastructure, representing a
> guideline on how the generic driver infrastructure is intended to be
> used to implement bus specific driver APIs.
> 
> This covers aspects such as the bus specific driver trait, adapter
> implementation, driver registration and custom device ID types.
> 
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
