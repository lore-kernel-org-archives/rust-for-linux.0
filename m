Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792539542;
	b=nZrLIAHwEJNSVUOlCAU3PqN9SpiC57wFrJWrdUSd48ZeW0ILMx+3CHBeRFgwWVAhSZHX
	 O4aqzYPOV2hamXxNgWXuYP+Ez5G9K6/hdgHAGk3V4p8ebjknbFjKpw8BnAky1DFiyaNh3
	 wVvNiXceVRihxZqOYZyJP2FF2oYBy6+/mpzNkLbu6FK+pEuUjQNkeR8gXLHlmu4DYjTAX
	 8kA4ivn+9ImdbozNbfDjgt0RoB2/Kroex67f+QkPmA0zpILMBU9WQNfZXbNYz42doWlt3
	 z22OCuz7vixa6bVLkadIlNSV7dAessh1TloLtkCUJ9YJhHsx9/dwTkZUDPRg6ZyFEAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
	b=Jnm1E9bz1M5ARFjXY/kW2YlMki1tosZ/kuiXXemRneGA2lc0snUZhBWzhrUHxgiVuxNO
	 8P5kaiMl+5arepiPnGxO7eDyKWWyk0WfPiCu8hsgH283MSP/D3niDDnhx8jzvzl5eIvb6
	 /OidFfT7jCji7YXhmm34udXW55+cuJ94chkJCLuJCju86fYQOUPE/zjWITZcssLeqRqNs
	 PjB7rFCu21zeZOS1Qqr+1Ngtc/hQjZfYVmpeys8vDGQWpqNXEnY/obDey3Zg73sxpiPkH
	 IJ51mpRLAJLwfbKu2KZyv72oBStTeFeybwF7nAmjkzhZ+U6jCnXit49M2m1fGXk4TFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bgzntr+m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503C606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 23:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6503C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bgzntr+m
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3584f70a5aaso11018eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 16:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792539541; cv=none;
        d=google.com; s=arc-20260327;
        b=eA13JdRCk1bvaO8EhxmlVjpNMrAMCwuPC42iXr9LUS6RiOyZPKrXsDj7mJ1n0lPaFn
         cLTXhTG/Tj35Sl35yKuEzg2PlSgbwh/R+/Vz/4m7AEWBeILj9zKA5Y/QTyJuiCZG3+Uj
         MVXI8zyNEjMNVX/HuOF8JlodRKK7QSUWM1uMxezzM01w/WXN9U6EvE+Xufkl4jzcJBKR
         eFMqVgdlJvP6qp5fTixjYGwDl3DtIE+THCrzqSey2KrHhAG4dZu6bFmVQcaZ1HwWuklK
         UlvHA2oN7y8wG/bcFzi2DDvFPbOF9y8vG8lQVB8PdZZDSajYuEmMSylvcQHWHFZ8T3FM
         eI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        fh=2s/jHq2KNAogYfqblMzerz0dwOA0CI9hgk2jf1J/H98=;
        b=a5XQbgynYr9QEbdVNrPsIj5lNE//lutLBuTsVct7Rk/vPiTWSLMRF65Buc3hAViG0y
         /M8pvxDQjGTTAOXjF8o1gcm9Ht0ac+ZAfYF2dSLhp4EGIQuPyksgSIBM1SWnd6FxVZQr
         4FbjgVDQcLJgQz+QOmU1RVurlD/B/bt6qgyxuXNL/cHCP4vfu9wiLgThdu1kc9NBE+83
         oP2H0fo8+ImCUERn4BBxrpHZ/Y736GwlIlHhCK4Ez1jLMessbr+whWgCqNfO4ymCN6qr
         7g9UhXqOKY2oKUzRWhownkbMddOQa+8haBSO6xv7Q/MXy9xkSRLH2RdMqOevaHjZ+98F
         colg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539541; x=1793144341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        b=Bgzntr+mTq/MYRdA0vDX01hYOFuHOkjfr+4ZTyvXjpCpqA6YQL8OesCpTivlbCO3M5
         QLrNcPkQuu4f7nSljhd+EfMSskX1pDwzgDgpFbEb3F7gvSqx4xvsqhRAo2d9Z/VUlau+
         TQWiXzY3jhHLdmwdGYHb2lNYXe9tl5FVQNzlKuQL/RPEWmJDPxNx6Y7EEgecSXzniz5F
         6SBRogJ4XtbD2CxvQ+AswQLUubKAqNHdzT6OlKsgdzdOYAeiPusiU/XUA4PABalcp1Jd
         9nwfKUoXOgZdmty5Y3fbNMnj3f74JoMZbWWSmdjfJCvJ5kG5jlw8UguMEGYzTrNiOZRf
         lrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539541; x=1793144341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        b=a07Vkh013L7APbY/GTHxkAEACUCO0EISCJDiatBfmOtHOcB5C9DsrmjuDGb7Ij86dc
         PZOdsI6cdEpJFe1UVZ1DqGNFAPockOIqpe6TAj/29QiHhXK9qhnX2QOQtN5p9LeHZlaL
         GPNpUSgw0Fd3LGkXJBFFPu2cQJFIa3NmTGx9Xg+ddb+fjE6Q+l0TIBFlm6ufyofrR/J1
         vdURn343Fi2U+8O5HmQJrqhibyyJI3HIxf+iSv+XeJRzMipd9dJg3dZgbEfCFOrk4XIO
         fjVRfrkf+3NS9VeOuMWUmVTIzcUQhP2FBowBOP551M0imkqC3jzN+2hX1TALKq+We1wg
         qalQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDGkdHBifm48XypR0nw/NYRlkAd/YaGoOPR6orSeBLZKONW06r54K+kPlPdcKkCYJYvQDfreivWo41WaxlgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxrrSL8uL9c4SIX0TWehGZubjU1c2IJovuJaJq2VFMxqwEDPG3
	+Y6QyOJ7cRsr5HSwdbfg096+OV5r7oao8s7HpFs5rVhOudv912iUGngSl3iuFKBDsU1AqcPfWu4
	VN2yvQRB7feyCDRI4irUZ80LV8bI2QQY=
X-Gm-Gg: AYBFou06DlizFMvfJjY2Zsb1ASjgyLpyS/AbItdQarGKk2iluMFZaxEF6kW5cT0mm2p
	9EuvwbDxSb5eApF/DVtU9ulSvl0jNzS6LVPD3h2UKXhW7oe2ZxN7vG/vtlbnZcuTc+fgRp8vn6o
	JBZkVn62Mr9Mb8kpTG83Ia2zyc8qOUwsZ3vEr3lSCB+8tyTifCtlt8qbALg8fnAgJyJ7z/5QhK/
	ayKj/XR7TdX3xzgo+3k9Di1R1SDPBb06ESVcDxYaVc2bk2QGBkKXLtJPncfbXVCyoxq1+ypWWth
	VFNce1YFjOmCCzqRHjoNMIrpyz0P0cimP0IvxC1odLUnWTM5nFiT1RdBGcBUA8p/WLB32cxfTqZ
	V+3JJ16N+TlnrZCLPc6SWgoms9kmFDpW+JeQUqBfkIXEDV+u9w/OhmYvhTWk2BezDRHxLsaaptL
	NB+Tq0T++j6t/AY20gOtQg7HhrrOXNke0xkUmtBUHVyJKPdK11LuYN+8HLs3Rhpg==
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3674c43a7dfmr1490822eec.2.1792539541506; Tue, 20 Oct 2026
 16:39:01 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 01:38:47 +0200
X-Gm-Features: AclHuK9F_7aaAg0X585zfZoDOcg5-Ci0Oo6j4hvWMoH5Rdsf4VtUyCtDgPceqfs
Message-ID: <CANiq72kACdJ+yaKd81TxnQTfYoc1drNMxv-4pdWMty8dSkwxyw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
