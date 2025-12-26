Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0222874FA
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751581; cv=none; b=ApetAFhFWbaVYWxDU/v+2RajX5TQSETmFxtqpxSr6vs9y5mcAeMC+uQXqCJ8BNAkiDPqKNBvphcnApucTrxsSFOrTJDR1E9A16YCPvYgza7cYoRq3YS4r/5cN9SxanTKR+WGi0VMx07vvkAZIABPwfU/BQlKZoEcjfm6e3/THp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751581; c=relaxed/simple;
	bh=IfF1tfJ8GRdPBZqA4ngEtMZjxGIDG7m3DWThrfuHFU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=resWZqAqlx/C34XnUE0pfcOs7EWmXbPCl4J6Pk/8F3NBBgV8qA9nh8WIr00zV/kZ4eV0deV5kl8EXde+VhR544O27g9A9BDm9rsgtxp7nE2ThmRctwnTkp5vyqDPLhQbFxtDUSEgy0pazVjTX78w4AVzdQaYh3BLcgRNY7a2tVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQwQrwiv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQwQrwiv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4776079ada3so66486385e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 04:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766751578; x=1767356378; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+g8DS1brekFilhKPqU24+jmoPGWM9uP1uONclvMxcpM=;
        b=TQwQrwivu+S09uuow1S9+OQBfGb3fF3nP82yIXziOpPEi/b5jBnvcx9We0HfPby2wF
         SfWz3DIJ1TDjukegF9foyQi9D74rMjmTX7jwRk5Uq1jaK6rWkiKzCcH03Gu5zymaCHx5
         TtCHo9uMnYN2GC3HyjFoIopd78GBKbTWJ3b0QmUb6524rxlygGLbWRUS+uhHdnWql5Nc
         k4nYN7+FDanP6nXFfbWudqc4YwmLD5fqo1vU5/dBgTjftMtO17K37gN4vl3iGI5EjZmA
         UYQfAEFH+9IwZME1zE5LPuhfT9MiRkDQ7D1nk+87wFnJKk57OkrfnG112WOjQTziB6TA
         JVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766751578; x=1767356378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g8DS1brekFilhKPqU24+jmoPGWM9uP1uONclvMxcpM=;
        b=U4KS8pXSLfBoGWT7SdqQwD1SkLUzyEG+F1gI5lAdsJN4GtuXkD3k3aowiisOPq/+kN
         shpb4koKtEMtblWth3ZxkOHvdzVDxFkcz51pBzREc2OW03hUyC9P/8M1ds3V+a75rqYY
         oqfUc7HLBgXqSi7mM1CXV2VPr6FakaqHztkMRb01z2iyzO+GkmMzo6NWO01p6E+WPEOK
         S4PgLZ9uBUNi3dInWHJBDte/JpvZwfRUpuzutM0pgxJp0fbSXEKU5UPDxvrnE7Jsg14l
         1g4pl8UQp/q854ASrDunCgzSRc1FNtjw/lvwFCKDbLdSG7P+Dkcq679On+a+wHeLnzVg
         Ot4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5B8abyQXKtUZaKgkx8U2zAPA8NiiUTbFrnSvfB/icKp+Hve+9ckyai3I4D5K5hv+er1S7Vz5jwY0J2gMM7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIdZ3L77MlXsDBJ1kvLWoTqlLfTxn6xqA+RgSbK9nP9WA2akA
	pG7hJi3HzaBIYmI9rcpMNT08+KsO19KevzPpfXKkdeIheClLvVbSm49CJr/xBVPqYjPt+XBfR4Y
	Ietc+kfn/53P2vFbf/w==
X-Google-Smtp-Source: AGHT+IFiggyRrqbfO1UeaiphOJQUgu/7SgrR6uhdhGWRLerzvldj49nIHMXvnyLCABaCe1ZzEZ7d+vvSof7EsZA=
X-Received: from wmoo20.prod.google.com ([2002:a05:600d:114:b0:47a:9f70:c329])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524f:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47d19594b2emr227167795e9.20.1766751578096;
 Fri, 26 Dec 2025 04:19:38 -0800 (PST)
Date: Fri, 26 Dec 2025 12:19:37 +0000
In-Reply-To: <20251223120436.33233-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251223120436.33233-1-dakr@kernel.org>
Message-ID: <aU59WdNfBXyeS385@google.com>
Subject: Re: [PATCH] MAINTAINERS: exclude the tyr driver from DRM MISC
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	carsten.haitzler@foss.arm.com, beata.michalska@arm.com, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 23, 2025 at 01:04:34PM +0100, Danilo Krummrich wrote:
> The ARM MALI TYR DRM DRIVER is already maintained through the drm-rust
> tree, hence exclude it from drm-misc.
> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-fixes. Thanks!

