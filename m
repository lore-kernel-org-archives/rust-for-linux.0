Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA91DC9B3
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537499; cv=none; b=nDtfrdsq+a8MyLjPN7McUz5Ej+AO1Q2NNbUdxsmuQlNQTD3hO6arp9JFxDDLYeJ3RIsi5iznN/8bBsOnomNBK6YSA7AIb9vLS23M7qxx3pWWx2khZCRpeP7YKR3Bo6PyYwT0h0uiwsIJgHLkmbrhnQNjyjvvL1AQKhmTvbjrTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537499; c=relaxed/simple;
	bh=Sh0Wyuegl3U89t2IMn2+3vPBnjuBYsEDi6+plbKyr8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aql6ykFrezmxv0BTRgjnLiYcIQdfGpyhHpbj0xT4e+s9/+DQkWFIF2D3T3XREzVqhD0boOgOoluoPBb+MGnRoduEWZ8san0vn5c/1IwGAplIZ/Z1NW/MIPqpO/55vkaqJ6DemOZcypfCI3sTQAfIOUbX7eaMEZgYCtbs4OoekRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yqgT2GLx; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yqgT2GLx"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48069a43217so53398535e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 03:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772537494; x=1773142294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=38x5OncwAiSFYUDBr2ZhbAskiL0YL/di//zDMAN1dtM=;
        b=yqgT2GLxsniwtcrOyrIiJw6pSiPC6zj4wvX3yzvkIFbwEJAF31yKw4VDw9pmwAfXS8
         pYNTqIkLM2H87GSVNVqgUsrgvLM7M0HQyjDpqSO3jsSPCSg4kDgsTGbrr2f3ctGtcR6g
         wJfM1jtNYJRo2/ZjErbGHe9FSr+SRtdf9N9OaBxeaCPLhjaWcpZYa5udE1+YUm/OAcXA
         2ClBw7nziN8imlAa9m9JoTmrkbeZ+ym6tTTt/k3YwSF/CFfSFcPFeMXx8eeCCRVetYWe
         /CgWijsPFSc5BJqilik8oZ+c8G+qwQh4zIgY3BxGUCfWhs7xD/GxIlC40Kd5kPwfmKPz
         U6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537494; x=1773142294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38x5OncwAiSFYUDBr2ZhbAskiL0YL/di//zDMAN1dtM=;
        b=n4JJgLBZhd//9+eJqFKn3clit8olByfI1QfJYxAAV+eTbRUSiqNLlsbYlcokZYspuQ
         gOCKOBNoS8pm3Czv5+FuL/Ux76tAJU+RFVbqdnWb3/aK22919cEc1Tc7Gt0AN1a/+yCW
         ACXjOCDK5IRbippilpSQ5xeJ5SGBffBxTej1Ez7k8gKFJJxWv7JRj7Cce3Kgxx3FTrJb
         gUOez8Jvwd0cthZgjGYe+3fA7AMm4QQIXg5/uFLygycqgnYfT8pbLx46KraX5gOXXmR7
         tmnQssxBXZBw6qs/hsquUBSIUKcdG3seC6+nFtQGQegR74T1xgZkajA1h+XpY/7STJLP
         5Tfg==
X-Forwarded-Encrypted: i=1; AJvYcCVYB2hxmr/PqrWE+n/ZUDl1/aT03lgJ/qzKsT3yWBz3o5k3dQyGd0JSHdsRLZVaRxL8c6zXY39Hl8H4qIA7rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWmVYTr4qqQfd8ukWBSFx8Z0QGaOSzru9sO5uyQSc9PGKuwfw
	GR54PI8itYwtQbT6Ptb/OMndB50ZQyiC9BVNJzZBq/CrNI6Ik4fGG9ESCSIsn+0t74iupaU0tS+
	mM73loXC6CysHlqL/Ew==
X-Received: from wmbbd15.prod.google.com ([2002:a05:600c:1f0f:b0:477:9dee:b5d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e2a:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-483c9ba15afmr297261305e9.13.1772537493662;
 Tue, 03 Mar 2026 03:31:33 -0800 (PST)
Date: Tue, 3 Mar 2026 11:31:32 +0000
In-Reply-To: <20260302140424.4097655-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org>
Message-ID: <aabGlKYNd0CrO7_f@google.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 02, 2026 at 03:04:14PM +0100, Benno Lossin wrote:
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support unaligned fields, since they use operations that
> require aligned pointers. This means that any code using structs with
> unaligned fields in pin-init is unsound.
> 
> By default, the `init!` macro generates references to initialized
> fields, which makes the compiler check that those fields are aligned.
> However, we added the `#[disable_initialized_field_access]` attribute to
> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:

checkpatch here: missing 'commit' before ceca298c53f9

> add escape hatch for referencing initialized fields"). Thus remove the
> `#[disable_initialized_field_access]` attribute from `init!`, which is
> the only safe way to create an initializer handling unaligned fields.
> 
> If support for in-place initializing structs with unaligned fields is
> required in the future, we could figure out a solution. This is tracked
> in [2].
> 
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]

Should probably be Closes: rather than Link:.

> Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch for referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

change itself LGTM

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
