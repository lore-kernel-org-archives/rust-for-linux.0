Received: from sender4-pp-g121.zoho.com (sender4-pp-g121.zoho.com [136.143.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49F3ACA4E;
	Fri,  6 Feb 2026 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385594; cv=pass; b=az+VlbNBzcr0hPmzoE7LR1cyD5FM3FBHTLWJb8/En6cBVJTy6GpzvY7pa4k3SN+2fIT4//ydUipkTXln3tt3Is9AgSURAVs+r0ZXVEqWYNPg9VfTUN5W0XKbJDEx4u0ygz1d/4NbQFcZvMyw+75AJjEhUw4H8lwq3G3qsHcz4ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385594; c=relaxed/simple;
	bh=qwGdMNlmUxKpd1zQRy07bkqgOHklVo/X4zPc0eLQGXc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hmxjfjNwGXFoCqwkeGTGUQ60axs7bD/ochCtf3jIWAuke4DugGDBZJFM5nX8P8Xz3TK7OvIR5/F/4Xnlh90lXftEfkMiC5qy2wIreAJOlMLBxAcgnrM1150+TftUWQdUeTRLB7zNemhMO0ApOLXyROl0G2nW8jOTTdQQMlL6+LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Sb45cyqK; arc=pass smtp.client-ip=136.143.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Sb45cyqK"
ARC-Seal: i=1; a=rsa-sha256; t=1770385585; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bYrsqXyxh2adE/va+HbL2hL1RyIBilD7Up1xYXKSCrqgCYHYqZHmvp6juLTds9bTD0Q+PQrXeuQceHHV/VgGDN2MOhwRgMOmS5URYbg7xIasfUm/LcWg7praszUcq4B1kq9FAXLlY7WFakU1uMLZXz37roJpc6Vmd/5Xz9mjRPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770385585; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jII4uV7+Vs0Ibvaq1++auXI/SyWNRdG9jXgAmegXSN0=; 
	b=V/xmudkZdfPYVrmJNW1jkkFf8IsNj9p+8l38OASid1Tb6uYUGsiDozmWxk11YkbV/bvIH7/TfuD9pGzlrzUbpmc+ajPJyxFPVDfcK7qj7+o/xw0ue8nHXDPqJp1WJVoTYIww3P8nSZ3JBG9dgQSmW7xpYd/u0pa3M7qwY1QFyiY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770385585;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=jII4uV7+Vs0Ibvaq1++auXI/SyWNRdG9jXgAmegXSN0=;
	b=Sb45cyqKPMZ/rkdzUKdv1wwbs4cJWLRZnWalNlAC6/Qf9Oaw9uMWPBDHW7xn7Bx1
	YmEW3a9O2iu5qISAvyxddLKYYkmSFhixfIRkI4HqF8vu1A33eBdOVEQWV3V5HeiEU0Q
	Eo5mvT/HFK1rEOGKiufdfHcvFjbUEL7rljkpyvQo=
Received: by mx.zohomail.com with SMTPS id 1770385582739892.3909061737788;
	Fri, 6 Feb 2026 05:46:22 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-3-lyude@redhat.com>
Date: Fri, 6 Feb 2026 10:46:07 -0300
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1C710F6-CB04-4A44-BE3C-EBD12A87701D@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

Oh well, I was unable to think of a better plan than this ^

Nit: you=E2=80=99ve added a few pub(crate), consider whether these could
be pub(in path) or, better yet, pub(super).


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
