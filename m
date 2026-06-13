Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD2336B043
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339662; cv=pass; b=Xb2VK/GQ6hg39XKhzRG2RyI+k+xBWb5szWstDekYh9ArOCPEnFVoW2+tppiDTCLcDXfVOtO2GQB7QyptxzFLA9padI0oALvDzpo8lmesWOI6xnuedPCVqQbQg5zcTLgwltQKkpGSeTui5rqflbDcWLj1SOCrF7NJqyqUQCF18gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339662; c=relaxed/simple;
	bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FacjsqWHEKZRe4NoudumfhsrYQQh7nTh7OqL3zbruABQja+pi/a8wTpAxKWnrXq3v4oE7NgkvZUUiENoPMPjL3MBuSZHads/m2J+VLCcQDE6qdQcmgi/3XJ1ZCKaIYicyaRCaVL+w+GQaVCoAaxtnGGqTFXl8uJqKdEFH1aueJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeIi4mAJ; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeIi4mAJ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so222138eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 01:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781339660; cv=none;
        d=google.com; s=arc-20240605;
        b=S27GPOuQD5/oGfan9MvNnkwY9pJs8TEPeTxSE0J0wddt9ikjtnf3YwhQNMTqHnYEqi
         lpkXpJA3TZUvcyx+FhOrmzdosv55Q8xivRqent/MrdFiWz02oP8lhnjqDrXlWdG30Qcy
         pkpoTsWp68TXNJb4KxS+zLg/N9nfI7xQUNO4CeBNGZviPTx8AC6Y9yeTipCjScsZAp+A
         7ZpwIC+ZrD+L4yC8GzW4CrYg3il4EyV6yRe2+P+blJinWxgnEsz0vD3Z5j4ZKNF7D9zh
         32ZRtxgOqVqnnJRkmCymP0xePkLUj4pBiGrLikQ5PukaSVM9tu7vqosn+tz8nZ35IvMs
         u20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        fh=fMRnMzr74ucCzBI+6wN0mCHG8OTBKFrLA+kXgzNoHnk=;
        b=OvTrepJT3oxIVQzB25nLpIAcI1x+RjHW/tpys1A4fBmFBQvPy1RraQ8f5HZm62erq4
         M38YMBoDt90QawhJ/vKvDAzgTfJEJFfCxWsCn69rVzV3GIygF79TsiIriH5bdtWZ4zPc
         PQ9f6iU3G5trEiWVsRgkzbkGJgKQrKXsH/oEyA93P4V5pt+e49U8Bla9fGSltasU2J8f
         ozNAxpwPUao1EQF3/2tVi5Mha7Od9E2UC90vF0X+/JQHsQm8Bjq35TbooE1R9XSK/rVX
         x+LR8IwgqSoyF1zHe4PZGTnFw7y7C1/d/WHHnMBwOQt5X6VTTHl+h5XAZzJ4avWmh+PC
         8UgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339660; x=1781944460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=XeIi4mAJxBCYHlo8HYIjN+xAuukEtAu/qJJpUROC9Y/w2aU6B1ECIJRowpZ9XMtwFq
         aC34Yw1i5Uc4XTk4MYRoXf7zX3LthWbpphpmpao5a8MfTX6G1QsyYP7bwgg2XMkFxXkv
         D1IoLT+9IFBQkXiCnZzhwPc6tgEx2nVXKyXB1A9zjsX1fUpiUXPUtP6UEOoqEzlRiNQ6
         bPVmS1vOd7fnANsojoZyN48TFQmn5r8ghcWZj2cv3B2j5G7jsD4MgImo6TAiz7566KO9
         kGQYGe6LYwXAWy3AOp19tntL0mSuF30R8VXBa0bnVQ4TDAweR5pkgdMYtvyCnKGRI6sQ
         A/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339660; x=1781944460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=L4sh7t02GbQp+QJgqNRlAg+K6/m1yZ7pDPuf+z+iOFTQTE6gN/T9wTio5Sn9BJa/L2
         fABhvp6PVm/e1RItGkHH5J95BLv8fpGcJLQCJyUZtNFWl2NlYPnSKnDc0qbf0TKrcj8U
         83NWRiLcVmXAd+OsuFAlyV6995OOSvIDIzOwpedAHio0uhf3xG6+fiGhqD02RhyeR5P0
         mO9vou2VDXUmz9zWOsDBVwzvpw+EU0yU1k0PTMql04ctVRXi9f7QjwHHZuBUnRv3Z+7a
         O8gjjqiFP+tx/LPO+Vt7jb/YogViDHd287Bpi+KpOaVGq2JhbmSENPY0PSU74JBAiIlm
         v5ug==
X-Forwarded-Encrypted: i=1; AFNElJ/PeMPvTILBPSlkNyCYrUFiWzoe//bcRPWgLrkI0bliyU/AjnEDMjJyVNemOdPGemKcz4eGMCnesPxo2miT1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWmoPYXFwWtA9rs75T94l8z2tU4jxLmBFlTpZnZnlXYLTPKcqf
	fCxm08h/OSbs10WYZX9yLezLKy9FFWvBjcIVgkJQWI+6RK/cM2uaJ+I1CehaL5hxwQxfbhQGHyP
	sqzVNtEDNnJtWw2rPZWPq+93BA+h/wdBZCuTkIcM=
X-Gm-Gg: Acq92OGoGTQBLSxIHG5RGs4dM1Q0GFMKSL8gegeg1dFcNHBelKmHwD/uafma9Q3yI/h
	JD5Hb5FDqu7s5pWORB3uV33hf+ovNq8aOQ//xAJ2zJ0rGvM9J41QO+VF7rg3j5LVSmHXOI9zX5X
	l35LWKAs/LS45eadWQmpOQglwD8PeHdCWGCrUSTspOP7YNl85YVQyG/k5OxgCQvSID1JY1VW1DP
	nu0OkjYApRP9WhENU/pqzrq69fqtaDT+ViykbcABU/ocrBAHRF87ANLTHIhui9j0hzPAUO0kicP
	hG/n12LTzWASfpjXzMVRKUA/y7rYoZGUUPLN6rgAna+JSMa1m+zQXcuAW1AucJnYxfByhlkaTwW
	s9k9Itzajle82Jiet53ehaSk=
X-Received: by 2002:a05:7300:641a:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3081ff5f11fmr1542136eec.2.1781339660064; Sat, 13 Jun 2026
 01:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-4-lyude@redhat.com>
 <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net> <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
In-Reply-To: <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 10:34:06 +0200
X-Gm-Features: AVVi8Cc-0p_Glp23G0kVyr_DFh7-Z-_yXR6xtOVae_M3Gc4DHlyl43G8aBfq8YI
Message-ID: <CANiq72mffbi2BV9epfZtN1qmjM28B6qUp-5tNGj=VBTimL-nYA@mail.gmail.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> As far as I'm concerned there's no need to do that for things that are no=
t
> rendered anyway. But also feel free to do it anyway of course.

It is not a huge deal if there are gaps here or there, but we use
Markdown in comments too for consistency.

What we don't do is intra-doc links there -- it would have been nice
if `rustdoc` could use those in comments for the source view, but it
doesn't, and while I talked with upstream about it, it isn't likely it
will happen soon if at all...

Cheers,
Miguel
