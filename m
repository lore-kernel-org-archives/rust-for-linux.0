Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094A3AC0E7
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980497; cv=none; b=dX43W1A+PKWJXLfjffMmSrD339ckFJPPGCl8PlJkYRXqgqQs+iEl8pQGSfASMcy37wc6ogrGmJzrv3trSDX5K/+4bA3xDig3t1/YM59FfRUU3tXMgAH+IlDwR3Vj16asfx9Ae7WJqTMH58VpWx7i1qOGelt7GOB53HuDviVRJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980497; c=relaxed/simple;
	bh=tV54au1v/xW/ayO1OMC/C9ql6LNkglkle02EIFwN4d4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fW8sWZ4DcCykz9eLgKGyui/32h/dyigSiDAV1mjO+SzG8Rhjn1VaXvAL6F/Fskjtqfculpumm7/wh0k7Kl1U2y8iyFMwSqmK59hRWeezNc7dPPC2567KSP1Omd7sZ6JSsZSkrTz4J0gUGZwke8tGfuC4i184Z5kOhFcU23/hEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd2rt/En; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd2rt/En"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d02b4c3601so19974525ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 18:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980496; x=1786585296; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=14el0lPn9bSOGa65U42LXQG4cJK+qErrVwuU+N5k1CA=;
        b=Qd2rt/Enb9GC1QsdK7iEhYRxoyzpuUtPkDgPJbO+6Qhh37djffCGOtD9QE4xHh5XFu
         /nTf+Z3usu8yIXxdjNhi2LDYBmKTInpcLER4W5K3nfcNGXxkCItal1nr8o4rEr6HeP5n
         e4Fa7grpL7K+7Ep1YLHHDqA6838hvYUFp+qAxY2AiONKzD6EkCXud7cR1HqDRqgh+GQn
         sxbES0kQ91seXOgrZ3IOWnjFIh727kPV2pj120HmJXVpm5zoYQfV2QCCcgdLXdqNTB/7
         IM55lGPQ7oqu3l9TxoyndBPfszPpXwc91+qE2+nFOIjXVrT3IXpb22jKCSsLZJFozv7W
         zl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980496; x=1786585296;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14el0lPn9bSOGa65U42LXQG4cJK+qErrVwuU+N5k1CA=;
        b=AbVRrCp/mo8i/Oc/kqOSPcetNbzOFGitBlcW7IXvI00NGEsa06pTKoAiIYVt2yuwJ/
         tSDb+vat9OGJh/FGRRgEndb452YRXy+efk8iUXPWo2AxNbkIqdsb9IPlc88kfSPDKzvU
         IvNAynIIegs93ruYWBuHcD4nYuk09YzuZyJW6sm0huJ84BQcfCRwzA5CmjVGH6n+wlE3
         YfWYgUFASF89DGMsSFs8Ry0DqU3/Wc9QmzkUVFpD8XtDJCAvjBaP6cB+hEY/wlaNxl/+
         XtGHGa8Godi7RN/oWVRmWS38YMPSRPG/dg9vjdk/Hr6k7KqR2XiZ432bGDQ1PrGK6b8a
         Qjcg==
X-Gm-Message-State: AOJu0YwfWxoCclx0hL3NVK7t+vo/zv24gYoQNnv7WtBPi0dstWQffXwu
	jtb6LaTuTdPaSRGubSCKH81fv7NR9Kp9coQjjsBvY3P2FxctdlWBBm74
X-Gm-Gg: AR+sD13M1FCJ5pxOxFsfx33lGK1i6Lw8wuSK47bnuYg6byh/2xRTp3B8n9P9pca5N2h
	W4vY/xvAd7KqQ3QgzHUEKXWXiQ5PiAbeypktlCIwJZnHp6DoP5GD+37YRAk9dHBmI/jsHBQsiuI
	dqcZuKYRikZ9CkN21fjMyNK4+10aK+8AU6iKW6YCFZ7Vwm6onyN1BhlP7UOgRehMU/VROCNLdCl
	2TKoiUk4xMyEcrFd1SyYbF9rcl5FSbCrn7QB3blDu/ErtmHWlv+JTqxmJIMNLZzy2JQOPa9DliM
	o7LJWka0Ai4C47k2ff8uzXmO4BRNR7u7PuNYt3qpZAwDnb6Nq39xOz8KiyftLo1fB8PV1Zef/22
	oSHQq4pEvFbnz63SigTvZskZDHhGrjxMQjtpAUPmMWVty0iVmX7/3taUAqWD4FwZnzQIXY8GVIz
	7dUUdFkWzp8Ek0Arb/12Jp881PYINqJf5NJ4U22R+jW2xPQn2Yon7N6X3JzFwty9QTiS+Fcnjty
	FHPWzBpOp6nvCrD3VlCz68g
X-Received: by 2002:a17:903:1746:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d0ca761e0amr127202115ad.11.1785980495796;
        Wed, 05 Aug 2026 18:41:35 -0700 (PDT)
Received: from localhost (S0106c4509ca6eb5e.vc.shawcable.net. [24.80.190.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d68easm22473625ad.68.2026.08.05.18.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rust: io: Add a BigEndianMmio wrapper
From: Ethan Plant <plant.ethan@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, 
 Michael Garofalo <officialTechflashYT@gmail.com>, 
 Ash Logan <ash@heyquark.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Sasha Finkelstein <k@chaosmail.tech>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
In-Reply-To: <20260805222110.2949369-1-linkmauve@linkmauve.fr>
References: <20260805222110.2949369-1-linkmauve@linkmauve.fr>
Date: Wed, 05 Aug 2026 18:41:31 -0700
Message-Id: <178598049138.1212746.2443151507074972963.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=plant.ethan@gmail.com;
 h=from:subject:message-id; bh=tV54au1v/xW/ayO1OMC/C9ql6LNkglkle02EIFwN4d4=;
 b=owGbwMvMwCXmcODvRtktquaMp9WSGLKKn/ld+Me/c1Kaq8vTwqRzT7L2z81SmHlWwMCP3fvRD
 J5K1X1/O0pZGMS4GGTFFFlCv0zdvzX5jMeSt1JMMHNYmUCGMHBxCsBEdnxmZLh7/8AuxZY3H07X
 sGZUGd2/16fQ42SrEnzT3bHl8qyAHbsY/mdbczj2XJC9tMwn7lSPfOTvxYH/f121m9pq7XL+5X1
 pEV4A
X-Developer-Key: i=plant.ethan@gmail.com; a=openpgp;
 fpr=55F495BFB563CC48A4ED1A0240C0FDB11DB42537

On Thu, 06 Aug 2026 00:21:09 +0200, Link Mauve <linkmauve@linkmauve.fr> wrote:
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index a38c20ba3d23e..a91979e4392ab 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -1751,3 +1751,87 @@ macro_rules! io_write {
> [ ... skip 17 lines ... ]
> +        *self
> +    }
> +}
> +
> +/// I/O Backend for memory-mapped I/O, with relaxed access semantics.
> +pub struct BigEndianMmioBackend;

I don't think this backend has relaxed access semantics; this looks like
it may have been left over from `RelaxedMmio`.

Perhaps:

    /// I/O backend for memory-mapped I/O using big-endian accessors.

-- 
Ethan Plant <plant.ethan@gmail.com>
