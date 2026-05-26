Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD623ACEE9
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803768; cv=pass; b=T7bRoMNpbTXPCnaQQR2HQnmRQVU6qnTILmGcVte29a/99dEvyVLcF+h0+trw585wnh8JdnHmH1YOCKwSAXlfF/tGks1YX2lHnqRstPsNdOB4B2Ezwwz2DFDm1HS9nRf1jntIYGGEydaZq/jT8xGuJdqDpbxOnHrGEJqBBcHOuv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803768; c=relaxed/simple;
	bh=skJ4pzip99V2f4F3f4qjF4oUEt+LEBVDzI//DWmgKL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyejJy7vBNrpje2gUqJzhg7X1BCpJSF/pW7d3Wlx1Bf4JT0Pv2Y1OuFaUFFK4Xnl1krHTPddxpoZxmU2Lguj1D7A6774gFmx4/Rau7K3njuWn+eoto+jsGeY90gY+GQQRZpS15Aa49f27GRn1j2vIId9RwtBM9xy157IyTi+67k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opLzetOA; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opLzetOA"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a409f3f2dbso563149e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779803765; cv=none;
        d=google.com; s=arc-20240605;
        b=YkOJlcnSRzunntkZ2GONq5aoaIMPGB+6h+635TIH6FJUuue8Av6T5wgXru6kY5Knw8
         IvV24ugA0usJWQZkly1Ykx6NC9ABSorSxUU5jJV4ERxblzCBNunGpXTHHDbHw9dVVTYb
         RjCq/XK78jiHdm3DP8BgMwe46qibZMku76zwyNNBfUWtXvxUvrl/vGvCGf314LvWObQi
         A9ypVk7S4xWfmUKGCC7DBM728b6Kf7+fWOu77/tQoY27rPrsRzrP5pC6t3UYKYbGDapT
         WQ1u/pNPtW8SXP5APJRVqR2VecEi1Hfj71JmMLyDSVhd+C42atKwR6qq2dUY7q9fgQak
         b9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=skJ4pzip99V2f4F3f4qjF4oUEt+LEBVDzI//DWmgKL0=;
        fh=QJDd5lAX7AFlvcT83ULUpgVZRD5ACKRc3+2qPNcrmnc=;
        b=Z3yKsYB0V7rGl89/POIzt3V0IkCIzto1GX9f4uH8b17r71eBmzJK3HbiVDD488zi4U
         fqtfPuSVZOh7TXoN0iJeh9jyzDtUrGS06NmH6t/tAg1v45auyzcmamFz6xNrxhWXHgMW
         BbhdIJugdv4fWeLqGDXGIi9zSgi6kz9p0gbYZJ3njWpzUOmMQi1g8rHCqQuQHw+9krUU
         lPbwi62o67SkLfHp9hTKyoLlzPd0sirTn+yMa3qWpg94aYhnyH9A7vY1ZCgxy2niP8rz
         efEajN9PA2AvoVBTAIV6HZfRxRJcarn+fhroJG+UqCTA8w8MYk8JCehAdNTzQNQ3HxL1
         JjkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779803765; x=1780408565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skJ4pzip99V2f4F3f4qjF4oUEt+LEBVDzI//DWmgKL0=;
        b=opLzetOAaJ0JfKZhIqLBkMkF0ptNuUqbiizn4ldt/vCj738j2f9m9ciuMyGIPZl+u4
         BgilFRlKq6r0JuO8yJiklnNYgJgeXufH2xVQIr8PkUaTO7bZs/Kc0D+C0p1dqJMbvOPz
         V7ZtRrFmcfnOgwA2YVTbb5x6u5jmONZE1dPAWT9RAZVNvSjQKyfdOzv6D8RSvk8qY8Sa
         RB8RLB3ZEbhyiv8DegMbD7ApjWmCYuzzrdp/GqgPKtyT5rV/5FHJ+5b6IkUncdsxUgaO
         VSP0lSl2TAdaqEncckeuSlYI7R4MrVRRE+6B7jXBTc8zc/s5wpvesDkaBeIGdPcnJdLr
         cu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803765; x=1780408565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skJ4pzip99V2f4F3f4qjF4oUEt+LEBVDzI//DWmgKL0=;
        b=IP76PQNc8wkZM5VFxuWBXR7DaDXTEDXOPe2bfWcXDtsvZaUNb6lQZFP1Nw0pHj9aHQ
         85iibfmXYhjT6/+4qBhCXkj+UVrnG2sCAyuNIfnBqRce/d6ZZ6q4BRlHsbhxnaQ37tGE
         f2Mshh2aQP3E6PpSyYn9Nr97+LS6aoTVxfuaX/wPY8Yja2Rf4FcKqnydkbbIR9y84cck
         F+61tdIsFeg3E/JWd872A4yB3NrUAkU7I95jvhGDE5G0CdnM5ubiqUIpmhUMFiruTZxn
         i/wxN/E8PFaNEMpu2OEvXXHfiYkzJY9LRmPuPFgxb3MXx4t/DfYwWQfIYpb8XrIFLK4E
         mpBA==
X-Forwarded-Encrypted: i=1; AFNElJ/Jld0Ra1fQaVO6KkhsZyQJQ6Ki5DY8KhH6EO06SQLK596uqbr2Q5vgCLdvZvrN07MqtCDskT/jJF7TL3FP7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxevUa2C48uECgdx9VV76OEvfPu5fGyM40v/JDxh9An/ItKBQIW
	LbbD52LwwHOng0iRgK0Fp/ZyNKje7wm23mBq0m9skHL5sVcsPEZjExTJy4GcbTwt9dOwRdjusuR
	mYZMlEq286euQ1veJQBMsh+DsHmPxGiE=
X-Gm-Gg: Acq92OFAT7nzikPpOMF/qml/aFle9AXD9/awSpYT578YNG7ROH4eHnxZzty4SHbNNtb
	t8OLJn1oc/937ZvFl/U2BHe/cEYU8gK6bQRbOGVRz/QQ/vx/2Ew8Inq/wV/Q306pnNllvvDPx32
	nPGrM4G7uJRWUkR++2tV8tfL5Stv8xUmNGrgUxOsl+WrePamDTvRNKgs+hPQoDM3hg4BWYiIHBU
	aQ7/I7TxiInpCOvI0NZDjfjr2hG71P7DEKFM8EGI36BKZbBwvyBiDRTm2x0vK2inh0vyKh1fUIn
	JhxuTjjA7bnsNFT+IWLnCtiUDAld8BUFvBp1F3KCE0A9iq/d2Dw72NnDuhlrBfJlylJ32dt1AVu
	Gx4t91fgjMWAfKO8I54spjX6SZHpz/OnR2Q==
X-Received: by 2002:a05:6512:63c7:20b0:5a8:63e1:aeea with SMTP id
 2adb3069b0e04-5aa32393df3mr1527774e87.7.1779803765118; Tue, 26 May 2026
 06:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com>
In-Reply-To: <20260521165622.279953-1-japo@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 15:55:49 +0200
X-Gm-Features: AVHnY4KTi4rsKV-gEnMi6c_xkqIBwExwCWdp00m13FmmrbjP8q7P2eHjw4934fc
Message-ID: <CANiq72kT7YEuMaM7wkOtCz8ZqEXbPLniA-x4L7E=B+x0zXt_2Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] s390: Enable Rust support and add required arch glue
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 7:03=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> s390 currently requires a rustc due to -Zpacked-stack, and the
> minimum tool version gating is adjusted accordingly.

This doesn't matter unless the maintainer applying this uses a merge
commit for the cover letter, but there is a missing word, and if the
word was meant to be "nightly", then the paragraph is likely outdated
anyway :)

Cheers,
Miguel
