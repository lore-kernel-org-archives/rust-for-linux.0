Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3503560AAC
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707847; cv=pass; b=Z73kDUBQtEkkD76RBaysaubbLpJ9skCAFlrQUG+afJNZM26yP5tYh3HGly74AR36mBajkKnuR7mTINaPlbm7yJa4CDUVS0y2yVf9pFMigL3r/0NE6PKx7ZVA5E4N2pNWaHS0iwAlXv+BYAKvoAZS/+Wm28oUmmP0/bVz6qMi+kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707847; c=relaxed/simple;
	bh=UbtShuScZ5XB6nCh0uVGWlP+LllZRa7OHD8W2lIo6UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOYZtwDICP4JlCkMJlZBfmpIX4ub81i+3CzcQu4CXtfly90kWJNP8d4zm+zJcqr+dvBPy/250u2AO6uKpy2cu9RwjRl/LSPfON7C4ZvojAURRvWeiUv0bWzSxIHKcWTg8SCtV3ej8S7MZruNHOu1ZVbKyJHvXYK7aOgoeHxhdcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBr54pnP; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBr54pnP"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-343241d5d34so268445eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790707846; cv=none;
        d=google.com; s=arc-20260327;
        b=YapK4eyg8ddRqTaEoPaLq2triWU4v/8Eb6SwT6nlgjOiQPe/mposdDCrcMYAVT8JYl
         1JXw/kAE85YY8o6j+LinWeX+bNNz8wk3dTkDQlVFZmjcWHD/SxNE8q9jiUQmtL2R9pkE
         ZbeFSaAKnn4dMd1OE1bmEkCH1TcAVswPCN8EPJoh3INZzoVfrEFAbNKFx9zyzGm8NRRP
         Xr7JOtMRIXrAaOk5oA1V7xp25c21ZTveruWaPPRESYa8V92Jayb71PZ3pTvxoNUyMktD
         8c0UIkfYMbaDCBDzGQ+c1B/vr5eQnd/kjRPQdS0AG4ZW/cSqTQN0d/sK0h0n1aZ5HFgd
         65qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UbtShuScZ5XB6nCh0uVGWlP+LllZRa7OHD8W2lIo6UM=;
        fh=EIbG2ZwBxNL1Ku4+KSFccvEXlTtC+qagoPxhkw5/0lI=;
        b=TIFEg6zGSaViFbvhFgYUA+2wczZ0aCO9+RC/GqawIWPpBaL+X0n1R1gRgw/UvUMkGG
         oy2KoKpAUQBlTVPzy2qVLQcZlEBwWTwYoYN/GInkTkA/pQ4//D/iaI3wSmMJH1JmkHzK
         xLNswk9PCtngpRGXrLmWJvtQQNbBzWyDM36R6rSj2C+bj0C1G3e3wisE+wXEW/CgUFJk
         ylXJyDSkeHr8IuXkJPTqE7Kt2cmsFKMgvCwopA9K8drC6jK3wbXUGRTVDXqfDmKPisXt
         u3qeeCFDbwhPeFW7PcYCU4HNvunEVgcYsynJVaqB52fK98NYBUizbpSNw+e5aCsDTl63
         T0oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707846; x=1791312646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UbtShuScZ5XB6nCh0uVGWlP+LllZRa7OHD8W2lIo6UM=;
        b=rBr54pnPcLf2kb8rcR/JKR3YpUIp0E/+dBEfGtwBOMtiRhYrUG+c6eBZgLNQExtTOR
         4bj/Ua4J92maMXzOFv09I+vqMseBpLugDqvzPTFp4NDT351/41D+lqWrcb8ktVZNa9eU
         ISnbvX7Z0cAI3l/FDenVb3hLw/f/s8E0g5cPzBZQDh9ThWrZ1S+0Yi9ParHW267W6NSA
         i29hWDuHRvCJgn22NTllJezqtrr0rGecmvgwaNSWpbTMcBhEPEDXoSG4FqLNPdrWGrIp
         gDCjyWIkD3F7k20GJP6gRMTuxkJNk+l1xbLyEFCtSddpQclXcQ3hq4Vwa2fvBbCCz5mu
         j57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707846; x=1791312646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbtShuScZ5XB6nCh0uVGWlP+LllZRa7OHD8W2lIo6UM=;
        b=aIvpYmzTvbv5Fihf3FurX7ROotDKuWEAOhD3c9sMck1/TjQ+38HjThd9rnD1J6d3Fn
         YnQRnZRKVgtFAPOaY6oOwYXS1WqrrdDP7m4vJeW/Q/CYj6H3DHah2D3jH18P5auN44X5
         v3Zs3NjKUiZn8N3XeRipEXhHKeuUiuCvVBinrCHhDF/N4R0vve7foEu84XS0d64cxeMi
         K7639HXnL+6gBHqjRcsXKGJJ4y9gkLZepxNxQNaO0FNb6v+7lDTiAJxSmcgO0/Y/GX+t
         5hXq5OzuA9Q6mP+It31837B82BacJjCglUT0HKuLfaLw/b+o4pvAxfbyLhi9wK3h3/lr
         i5TQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3HrsSiJCD+ZcuzhVrkPwfuOOmp/UpBDsU5V+4N2occvhc2X8PLuafqb4UxXcN8lVUlIQMNerfi2Q4pkHcRA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJr5CqZbk3s6lh84WNNem48k85RK4eyuZUu/JLYNbV6kA1Ey87g
	clbUW6BGBt63XYplHdVBBC2uqhA94fD3mTnZR4Jgo2eU+vhG9Fi6ME/NYxV13Ma0auVIRempRSa
	Bfy0w/MZSABmvmJeYxeARLfb7ku9wfCE=
X-Gm-Gg: AYBFou1fS1462HK25D9PjtwjsfsYGKCnBZ2lt1tYPxHz8rTfuiVuIpfCCAwP8MNxdba
	6u/3gB7Q7oA0S3lnuNBb3ovWf0k2bsa9CiAgoWhbLUC8XXfGeXfVttJnoOwlYTwHS+cmIsHeS2s
	/TEeWnonXl+9oQMW35OJUdy67FqZhB99cNmddN77NqkueaJ09luvrEXNr4V9pdKJbLS3uIC0Osv
	eZ+7TXInOL1fD32/uXEkcUnHPEUnFp4IHEFba3KjygoRzp4TGhXh1I0LWe7gOMwbRQpGYc+AFZG
	t47oXXgrvqoifgMhXwuu2qYDT8GNB8AuoSANzNbmsu4jV6Ww2aL4nYgLtxyREdWlskk8XP3wLXF
	JrEgy4T6SdOE07iKo/y/aX6LpW9aaedUuTv7Q5KMkA9pYfpdFayounMSgSu6aM/j52WcO4235J1
	8KV6A2VvSvDbX0sKU19x0LfoAfepEttASt+MYnCglGJ01owPHtk106ajMN1ukS2A==
X-Received: by 2002:a05:7300:54c3:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34c65e57c85mr396225eec.2.1790707845548; Tue, 29 Sep 2026
 11:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927125622.676342-1-sagartaunk@proton.me> <MA5WohQDVE-anywwlBsIffVgVU36GPYOzQQ5luqbMOCk8jcyKSKBHucUT4ISOAP0lG_6B_5UFZmFSG6YC1HlBVBW4sNL0BRcnuU_Md42-bs=@proton.me>
 <CANiq72nzgVKu8BcmWSLLXx0ve6zA9wt2GnYZkFoyLnRnBvH6wg@mail.gmail.com> <hdnI7q1dwylKmPbpvwy_SdsHwoCt-OJfs6orHIhdc8ltPvAn5r1zCVtNLDNLf6AzrkdvpgFuD3QZR5gx91K0qeMv-XvaIU0EsrHr77HSxG8=@proton.me>
In-Reply-To: <hdnI7q1dwylKmPbpvwy_SdsHwoCt-OJfs6orHIhdc8ltPvAn5r1zCVtNLDNLf6AzrkdvpgFuD3QZR5gx91K0qeMv-XvaIU0EsrHr77HSxG8=@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:50:33 +0200
X-Gm-Features: AclHuK_cKGZgXSC0yvnHq_mNdQborIUpw8uOcxDg-d0sR-8aVkLufOcgOFSiYbI
Message-ID: <CANiq72k9Hzdgr05Om8y4+jtLvP395b3WJAHY2T4AAAOJUhMw3Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust_binder: add transaction buffer tracepoints
To: Sagar Taunk <sagartaunk@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 8:46=E2=80=AFPM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
> I apologise for the early ping. I mistook the follow-up window for 24 hou=
rs
> rather than 48. There is no urgency here. As for the differing Cc lists, =
that was not intentional. I had wired scripts/get_maintainer.pl into the se=
nd command, so each patch was addressed separately. .

No worries, it is OK, of course! Thanks for clarifying.

And if the Cc list was unintentionally that way, then I am glad I
spotted it to reduce confusion for future submissions.

Cheers,
Miguel
