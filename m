Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B0440635
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137776; cv=pass; b=XkpCJNf5yL2NDAxx3IR7+M8ejiZFQHKOV/EC7m1ED/usML6rFNHFK5JpXnY73B2v/htZxC/oBhHeTL5DM8+VjEvtJFcwnVI/bvg9jesj1cvNOIHyTcQZWDWuXm4gwTXcqZIX5be2e21uXetq+TYPM924ld/352hNLyauJyET5a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137776; c=relaxed/simple;
	bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6uc4pfC4ciMMdBUV48l89OoBQM79LYfKUf3KLdxOMJXwRhbxQOItNmlygLtLqXAN8ucygC5Px1GJ61jsowbX5XZSPFkKpTNFiMZDmAApWSwwid/6x18KhxJBSxl0KibgC1WZV/AZo6XND1hfYSTYcJlFq7gAxCaH9kadEmTDdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YKTHjJRu; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YKTHjJRu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so19253405e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 01:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137773; cv=none;
        d=google.com; s=arc-20260327;
        b=PmJNFCeQ/Wwa4bFdy1Q3D5NurxFbvJVipNSh6SPTd7GKDK7FV/a4pvHEGhBdl0/zFI
         zaBVmjxa+jaub6P4zB5O5aU9uaLZFB9BfSkV+ppoIh5RjQR0XACKDpsQGZvJT1QimJ14
         Dcm1incSbb7sDgRStgmvBzZaPEdzKbyJd0zuXGqCRFjjD+/9gpTAGDq9rV2HUDNNAtbv
         yzKiI7rTB9BIVF6UVAx+UMspY8g2ygNXZgVrigPhYZ7zBkmpZ/iZGz3+ewFaGAnQGaqa
         m0g4rfhSqT4jvbX3rMeEZ3ncb9dvqSo7TmIjgx+GOH5r1As+ichs/JBQc1x7zeED/nQE
         k6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
        fh=BgYg9cmFjIPyWcNfq+XPZlJJtrGnTw1kwdy+9Lf47n8=;
        b=Mrwf7rbzqKeGYNHSzeXPWC7JD9I0SCxZ6FNsbjXlBxtRiCnuZZ/FNiyxiM5yn+PJh3
         RAFUpgECo9ZHuJrh5+1Q3lOtUhAIA+0JL6TFdOwS3Zk0LF0Q7i15KRvYrd4Nz3zseolu
         X2Dlo49TpHV2tiZfC8+U5ugCnE/27+PIyzNf4V0VHS444yDnT0328zqnGk6T/JqzXP5j
         t1sms41VYtD9T3ZiU37IYfQ8n0UcmwbImOOTrdg1eu5r16aa6Ry01sbs/wv+u+hXiMzO
         qqazMVsSctrGz5eXk3WQAaw8Zk/jae7K0eqPLxQMAnfgUPz2huvWvLXz9z7fEcam/qwh
         LvJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792137773; x=1792742573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
        b=YKTHjJRuVSF9ox1VEY8K6IamOaaN8yFGDET9uoeBC3KZVrGXEGtY5vnb30FNVTPFEl
         ZA0MG21uX9vTWOeR3sDO5gp/CStaQjQ38i19hbglZ4CJh3sqCT04y5g4ei6CBKAxZTNY
         xdFR9Y91MKR08QDGkt3nwSCnjK24lkhWIoHe14mtoWtwCcAEe/DcHDSlZJHcPoDRP++f
         hyjmIA3Bzjo1nFL9DtfXhJzaAp0MHzz7dIoHW1QeACGhwqiVLGzFlR3fLCFn6vNa9XmN
         WR20zBgcpY5+B2ox3ndU63OOWsHXfGSFdKQuJXKA+MvXYgqJsaio8PGghSex51u0MsGi
         RctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137773; x=1792742573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
        b=rmwEq4evOBTKBoARr1Vd7OpI2ZLiv0Ek3r4a1TLzxrsxbP4EaFzV18HjN4DEzBB/0L
         blf6AMow9FICjdapej8B7BmrZ2piJg8bRzdYqWsjKX5F+C0VZ7PyDmll7h5WOsH4GVEB
         h2LdUCbdAGB/PFH7mudAFkKNiNFnh5I8z0dIxFENqoud6SP3Q1RvcTYiwCz1vQZzFZ1G
         TNhDZCrbgyrxCF+PkutQwRAw/tvHXxuYbiGO8kI2TjTGm7pkG6lTmeBDlzFN86WVSoYR
         J/FI6JFyhnhW4gJwhU4doxSdaavrdS2FNrDQ1U96ijzLvpCY65f1OEogGPbisxg31ncW
         q8+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwT+rQAX2Y0EaIbQRv+SPv4EaAEJNWYui+eYnahWegHHE3Q1MFImxNiJ5Toe6j5O8jqZHBtW7n4FeXVmTARUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDRfoSK78Une4QxSfLqoOG8qFpIKWgnxlqH6LZ6e4Vm9eBzLuj
	HWZ6yBjselJ7XqnO5eSwSXK4CHhhVRJhAgxqBruhNIuFGcjvy3M2YtTn0z0NeLHh5fV9Lf4LtsU
	mFW9v3yy0TCDVKCjh7G/DGXxEgq6VAPIPfh4sRAqJ
X-Gm-Gg: AYBFou0wk0AGjZ+EylLC+zW2tWd86KRFmrLmUnkwODMz8SLnuBWv6FyLo6EhhzkOoRV
	sPVGR5JbnLPJMsqWOELe1hcV11RIIxn3lwbnQjiaTp+JzjPqoY8amFH1hT1hPtlOxJLCk+0Y7hK
	aLrvRe1qXyRxfno0JxYgMwV+JZsY+8NKtpPAYYF80oZCR2l/RngbaPLeTe1bTKQC5jVJ27rYaML
	0lxaXaX1WeohZbd7DDYu438zPIdZrCDmQznJKC0r0HvV+X+Jy5o5irfJysdkjoOXT50JMJnl+z9
	vi2tpnfndIf8A9Q6HoFXwps+QrYgtuyX5T0B0r2z42ClVtzsYHzBg9jTFdr4pubC69wUFt1I8Y7
	o2/Ph2AO/0Go/bWH8HY7bpWDDebTMa8J5AxQWlGRy7O1y1XjilLye
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id
 5b1f17b1804b1-4a18e47aa9amr450721915e9.6.1792137771107; Fri, 16 Oct 2026
 01:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-b4-dev_query_fixes-v2-0-e3e6d25050cb@collabora.com> <20261015-b4-dev_query_fixes-v2-1-e3e6d25050cb@collabora.com>
In-Reply-To: <20261015-b4-dev_query_fixes-v2-1-e3e6d25050cb@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Oct 2026 10:02:38 +0200
X-Gm-Features: AclHuK9VwH3E-o_Gsv9vnah3Q_w3nfSpzW3kvlPExDLV-AMTDeW1DeiF3LCmVWo
Message-ID: <CAH5fLggsJeaHfwirfaMvTUHr9rArbm8qPXiEfYiprjc9M+To+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: uaccess: add UserSliceWriter::clear()
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:35=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Add a method to zero the remaining bytes in a UserSliceWriter.
>
> If userspace provides a buffer that is larger than necessary, provide
> a method to zero out the remaining UserSliceWriter buffer. This avoids
> userspace consuming potentially uninitialized memory and/or mistaking it
> for data intentionally provided by the kernel.
>
> Use the #[inline] annotation to make this clear() method available for
> inlining outside of the kernel crate.
>
> Since clear_user() is architecturally defined and may be a macro or inlin=
e
> function, add a rust helper to make clear_user() callable from rust.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
