Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949713128BE
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296152; cv=pass; b=IMKT42qxTtxCiGyIQwyrTuLAUNGOXhE1miMAv7+CqQoirUYmIKVUu8iGftMQwUjY3fR5jJkV4mpThDR+aUYGPhitmSuxr5wMGa066zRwcCbwwr9aCMoD6cDQq1e1MTy8Nh9fg1SqAw3U6EFeZrHfXiFPj6Vd84uaka/vdd/LApg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296152; c=relaxed/simple;
	bh=PJXIkTay/jndjqa8EEUmpRhAeyfbSq5pqEpZt9+YjYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZCqG+PEQl7lroydmdXS75JhcpDCbUpMlHcclD5oWB8Pt0jnXAyTdxvGpEK98qz2DjyjRfyXuFAzIhtibzpowVKKjHwYCCAL1kBZE2Cq9KU4lX6MyO4XnoowutQxgg7/ZOSrENOoI55HYOemO2CuV4eVe+8PxaahfLSXUUubTP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAI68LPE; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAI68LPE"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12db2e9b5a7so260831c88.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 06:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777296151; cv=none;
        d=google.com; s=arc-20240605;
        b=fikjKGV8SD2n2vZBfkfT37fcOw9ldP9h6IL0m+1IDYRO6JH0e6gMu4lyf8MnhJHERr
         xibv1s3rZiQxibFm67MqqYgE3w/c65euQL4AyJNGJ5RpHhIR7RagutUsFqhrxfFzlwa+
         lcdP48cnun5MmeIFDK54sXLfLFLuqbHfcA2f4awRoc+LxydG8MaGzkJ5ngm2DacouNZJ
         H2aPEYozTcMhqR0epc0MYfQTDSYabA7tu0YssZbvPmdiAILCKy7f8aeWSTqtTdQN54Lc
         YDWPHDxutRvU0bFkBHptTqXKwGMKP+28BhmBgV3D5ehzGgQIpUTA9A9zIhrnbA6XUW7z
         uUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pNJ5JHXaANeKolgYhsoSJ9kokvn89HlIuj9j10KK9fQ=;
        fh=Yzq0Ln5zzrsRuBhnVqnlqaUHdP2GtjoJfnzS+4LzPcg=;
        b=U9e7eL6fKyuAWZ5NfGBpA2mmQZ+9c9OWpuj/0gzYaD/40BGsbJn7CM9PUeOs19Oto6
         TukvExliBYwjuJspfU2EnDcq3WPumhb0hmZV2gOy5WMDI+lXpYv/UpULMfkz6YfPjYlK
         bQI3+TP0Wx5QSoap/5y6CAtxI4QOdGYSga0xVECzyV56DAG+PY3BGWMTbGfznEr5no3f
         NC7iPMYfKuOonPSNiECsHLk3t+Ii41jzk2Dnn1JhcWEzz8jvAJBUCYGe3+g7DCHn6XWC
         IL3ZMof1nbfER/IYSQd17WXJDxqD8aQW0US96wD/zM3pBI8K5Th8TKFRt1GqHptOShHR
         XYDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777296151; x=1777900951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNJ5JHXaANeKolgYhsoSJ9kokvn89HlIuj9j10KK9fQ=;
        b=LAI68LPE22/YvTznKm6yXuPpaRimMS/YDrveH2laSTChJX4By06T8Jfq1GvzdfLe/8
         vSHpOA/65H0lly7Fs39WIKRX9i417XiNdTmIL4URg9/cxJVlYbvFpHWwASU/O23FO9iq
         0IQGU6LyZlX9csuPB3UN1kKDdfDrM+VEaWaHSQfftccUlpkigFspmpbFZ2R/DXUHGxMl
         GE+V814KjxEGF+Y3NyPvZqCIX893C36ImgMGf7tH2agHA1aWa9nXGBbJSI2hr/DfVKmL
         gIA2eM/eJQB0rd0Zj1Lx5OfmnJroQAHzuVfpNeR9ICWbZMTXl4CVIJr+Z3VBUDjgpOpV
         MZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296151; x=1777900951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pNJ5JHXaANeKolgYhsoSJ9kokvn89HlIuj9j10KK9fQ=;
        b=I5bDmLEDjSIn8Yms6+GrlgxOPQxWczHQkO953pQa5dB9H66GtXacu1ri8ARem+sWg7
         25fTuZ3fDi/IUDAylkx2QKUfpJNi2l2NYsDrnHGvH4AsPwq7KNi6UxRrPH4EegtQHvm9
         /3RVy5Cp52Ob6NGwrCv7YxrywjMcAUaj/tB25An408jeVOvfE7E1N92iM055H0lwWnz5
         e5znx1y0pK1VdbkptB1N9HQc0KbcJkrDyVNIPBCnDKlfSYRfltPJB3vH8WAmycAl0QQK
         8O/9vTcmIOuaEJIKiMPU2lEP2LXdEvGAFBhQhk+FBdKhs02JvCJ6FGKdsiJIIkFSHZMQ
         JeFA==
X-Forwarded-Encrypted: i=1; AFNElJ8cDDju4U9j9zjaeeOlVjN5+jTTbgV0obU595MsLPELqcjghZbQPr36ciDoAcjWVNSY1NEmX70WEzfH2myrvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7ekr12o5C79gGZoI/RUzT/yagl3/Qcf0epkj0mLfGyIWSOaM
	YtnPeuOOTnwZPlPUZc210JBheR2rMOYb4RrR+TeayxddJw8UuSVgOPYZ0IyP/+FRgBujkGGX9pg
	2Uc6Kapyf/T60c9dCSQLl3+2D3H1Bv98=
X-Gm-Gg: AeBDieuc02N7VNcZ8lqxaW4KRiGtVACJATqGB9nBmo2yTYZbG2nzV37C7XDEHY0BVfV
	YDjMTq6giqoCuiwLlGjeAvdcA7BMB0VmUJj+TbloZTFiV0n6hOGmrkeKp3iUbWQLr6/9cwew09A
	uRzX1Awo8q7BpfpPMVob4+OmibDPCcXNDL82uzybAh5KP2Phzzj7MeHxUhTepgg4YV57M20Vhx6
	Y1+41+y/LxvoxDv4Vhb8oR2l+eB4fdGkrrOMQwFoLvX2ViMcu2uyPLl0X5ir0wCP+pOYEXZ83kw
	85/03ojGtJvXTc5Ex3Dze4MJziO4ssH5ZmDb+ieC/bt7ouD4K4QflfJPBAmHbKqztEVvC0f5qNv
	jrx1XpX7JNEBolj+8p/vaoF47rzJdbCDt1QxV5Ed3AaOO
X-Received: by 2002:a05:7300:d50e:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2e478936a32mr9024517eec.3.1777296150666; Mon, 27 Apr 2026
 06:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com> <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
 <CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com> <69eedee0.170a0220.230e6f.9507@mx.google.com>
In-Reply-To: <69eedee0.170a0220.230e6f.9507@mx.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Apr 2026 15:22:18 +0200
X-Gm-Features: AVHnY4IZvRWXdCUZhFuVBDuzvfDSvCZRDWWLS3jBn-XLkqzkLCtlOLbigFhuKKc
Message-ID: <CANiq72mKS=uvd_F0n5LHBgBgpTvnP+RKX3gaSxmQnjwenktOTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: alloc: fix `Vec::extend_with` SAFETY comment
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, rust-for-linux@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 5:58=E2=80=AFAM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
> For this patch, should I include the Suggested-by:, Reported-by:,
> and Fixes: tags?

If you only need to resend just for that, then what is usually done
instead is to reply with the tags here -- then they can be picked up
by maintainers or in the next version by the author, e.g.

  Fixes: ...

(ideally without the indentation so that tools may pick it up automatically=
)

By the way, an easy rule of thumb is using, for fixes, Reported-by: +
Closes: + Fixes:, while Suggested-by: + Link: for features (but there
are of course exceptions, e.g. someone may have suggested something
important in a fix etc., i.e. it depends -- please see
Documentation/process/submitting-patches.rst for the actual meaning).

I hope that helps!

Cheers,
Miguel
