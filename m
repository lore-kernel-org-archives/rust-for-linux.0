Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795497779;
	b=06kvTCVAsh9gH0thPyzzf8rqv3dxPFjbWGkefknANNVDHj5cLdn6zZmnOIvHy/ja1aMn
	 AfqhVHNlMTUJql0me1BuqTVpLm3Kfi2YnWQaMfsWsg13gFSLTyDvT+vhOWZQet2aevbmn
	 oxNRGNsChPVkemn04f9LpddAncx+NrbmLJKLCjspUT59T6KcRwI4uxmp9uZEfKPZ3VSiy
	 ZxFn2hp5sjIDqNl8kdZbQC6i+qt0LtntFGqFu8saPVi6STUm3dV0SbwxDvQAl/vcNxLnM
	 xEh6Ks5IZX52X0ZKKel7vU8LsVeBAIT1ya+GJlSY4cdkTWyOehz72DDcpK88e4xxetA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O87hKc4hUbbsqQK96K8mzUV4IaSwRq0dFjou167Fark=;
	b=f6LlV3YY1dQwtFyH1cZC42t5C6bkWqySezcCABuMVAEZCD8hhz+zWnM21IJUoPDFVuQ5
	 febHKv5cVnglXN1jkbsirX/u6vobRevL6U6l7GDxHEc11qznaD5U+8OcYkui/UxCSbLHM
	 CITWOdzxrwpJRr4x/rmh9YitKQeXooEePD4zh+WaBWF3MXhil6CoAJY+ejV3kbmXcaknT
	 /fExThvDs38VJICAMx9A/SP2eayaKok0zgGSaqVllPfmbRl+lTSW6t7emyGB0uUaSXsxz
	 RL97RRQdSokhevfV86uB49tTR1EJmlzwKQRZNsdTnt+0cENt91GoQoRu8Oo71EaWjKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3CvJ6JB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0B606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 05:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D0B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3CvJ6JB
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-92123f02faeso43112746d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 21:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795497778; cv=none;
        d=google.com; s=arc-20260327;
        b=dOa+uzVYv01fuP6p+smKBdOTDcPXHN1YntZamF7xYdIobYmeLtk2FTyu7lwfUwbwfZ
         huzk4gtLuqldJQ7Lc8FPPJkrAbKdYZ4cDMHGBkJvp62QJpRw/Nol5oGsRA2p04QUWM3E
         dHbnjE5MeFDuQwusJcDM2B91VKhKmWvCEPKZMzOE7J1QohC8Og4EzaN3j4QP8f9i+3br
         vAGOQEN8r7TxOWflaTL/u8/z545W/xr+xE2CSJDVLm5kWZ+k7pGNDS2BPY8HcUoowtIP
         wQgJB8Ly11r7u8X63z/jOfT0EJqnaEbdXRtxDlaLRw9qYP8GmVcd+BVx3FV2ytOfPMnD
         1Xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=O87hKc4hUbbsqQK96K8mzUV4IaSwRq0dFjou167Fark=;
        fh=YXX2mE7BilEGHcy7F97f8Mx10pCdrpJeJvYHft5K/x8=;
        b=TFgrIrQ/OPRD5CqRvDSJvFJYnZbDtzZzEHfKIjzIOHxmstfUu1YG5z7VEI82azeU/E
         eSoWn2AxaaGfSQHpoxPBSz+u4EwhGMzy8jgkdbKirf03p7WyULzCzoK/0SvUKClpEJUY
         gPSrwpB0zovbyE8KFlCe0fSU6e89NDdfOmx08CPvk0/NdJPxipWRQG922LsJ0P/5nGsL
         mZ4RdQO+nfanGSgBsBKzzG6KhD9WHPLoWCbvVFjyhKGoT/41OA1aCVRoN36sUQpWEScs
         9R7z1NXb0uLtee+qpfAUbZk8n43N0lAeTPUgsKcHK9E5IZbe3NA5m1dJ9nU3021uzIRW
         dWkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795497778; x=1796102578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O87hKc4hUbbsqQK96K8mzUV4IaSwRq0dFjou167Fark=;
        b=v3CvJ6JBepR8LlfuJ2ix6Qraw04uyvSmnB/ad9OkujxEjO1l3qKFevB8K9xz4CSFd9
         DA3Jxzvz4Gw7GdASXgoqLTrobAwcgW7GRk2uvCstTmbLPINz7x+DOnhlujbss3UGV7re
         Dh/U4Ol1kEewdMbQOtxYqCv/cMyh3/+VllHVrfcyYmjFJFCJ3fEWwp6MUpXtJy9vzrh0
         6ilvNcdGJU7b2kS7ijIV23zDaQuhOYZp4/r1zqaquLU1mX8bQsukhST6/I+Nf77fcL8p
         RHwdv0Jme6gV0pxF/a6NxqYAQy3pB0p6Ql+EGva//JM2/xPJXiPJOOvBvUMFErZWcPLg
         K62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497778; x=1796102578;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O87hKc4hUbbsqQK96K8mzUV4IaSwRq0dFjou167Fark=;
        b=aDSjSJ9/O0uuAETZGvRQgioqhvKccOF1DweWy7mDIsAyplLlczknwzracxoOjCsamF
         8APYQnQcydtglZO7+Nc+Kjvmp2jZMVz42vatLKxlc7YRntu1wBOjhsjtSBFgnVF9gEhV
         RLcSz/X4ZRWrSlNTDVsEpzW47M+YRdN8wwa1rl8oA/7qKHpeL49mHLIzaQAxUkFuKcPg
         UWEUTPZNmZbBx48Y61x6WpQ4rxdY+ZWYo+F82TXK3JWDTktVPSRTVh7A//5x8q6bXamK
         ZoVREEQCURC7Nmtwk6wDvPFQhfQUPW/O0mMadFVxmfv8AHBrAVSMuPNkLABPHAANTgkK
         wsdg==
X-Gm-Message-State: APuU4Z+UvzQgDmAPt9MP6ysrhbtCcYGTtO/+XnSkqr7fupHi1K7n41MF
	EhlzuAKPmqwbDRqG0Uq6S2yAsMk4hSdO0YjUKDUOu1n475GW+8MzIEoPQb3Xl5VvmnZ4VRd8FGx
	ON+THO+LMkTL/kXel9yBWkMDdxuj4lzbKgVZ1
X-Gm-Gg: AZFdTZfQWQy/dtpQnPNQRM6kGGX1Ue/Ql6VFXgF7MsU5h5UzvIQqgGZBzBVK4iARr2r
	IqVb39ZAhxST1fBF3Ylvb1uLwcEpkQJHdlyFSzCffAyEp4VGnfPisz/zaie5Ul0GHMhR6RmC/wR
	r5NuLOeneapIVyCAfR0kIgyGj1XGRbwT0whtIPfqR5TYDAYc4SKuqx2RE+87wY7P13RQS2+dtEc
	tumJItP0k//gXRkv3SqPBRaFoUKjwcQ6aWqftrKcoxy4gXBt701LLhPtKeTcrDQNj2XTMbX9Mtw
	eAcsnQh95pE7DAG91ZwV2+OGhK5Y7DYSI1Bz37f0TGtuuy+079lcP4hvrsX+1LaquZns8s324S/
	M9I130si76IUh5YdECBNwQc8AhbXz+9mrolKlJLhDL2QFD9PASOqKieC5m4ZteZM1KEmGmVkQPA
	ViC78JVKg5ZoZfoRiy2WRL0Q==
X-Received: by 2002:a05:6214:508e:b0:921:3769:b79c with SMTP id
 6a1803df08f44-9213769b9famr219080356d6.43.1795497777776; Mon, 23 Nov 2026
 21:22:57 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Nov 2026 15:22:46 +1000
X-Gm-Features: Aa3M54oJBWaQE9qtaRcuwo92UYviGf4SAmjDWFc3egNkrmN57N-DhwkJNj9eWIg
Message-ID: <CAPM=9tzG7vBCC1GG+7nM7ViMPtfCpRy1ytZrTthu=5N9ddVi2w@mail.gmail.com>
Subject: when rust and checkpatch collide
To: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was using opencode + GLM 5.3 to edit something today and it went
into debugging checkpatch failures and found a funny aside:

From GLM 5.3:

Bonus finding while re-checking:
Moving the dev_info! exposed a latent issue: the message line was 133
columns against checkpatch's 100-column limit for .rs files. It had
been silently passing in driver.rs because of a fun checkpatch quirk I
bisected down: the Core<'_> lifetime in the new function signature
contains a ', which checkpatch's C-oriented sanitizer reads as an
unterminated character literal =E2=80=94 so everything after it in the hunk
gets scrubbed, the string quotes don't survive into the sanitized
line,  and the "line is only a string" length exemption stops
matching. The line was always over-length; the exemption was masking
it. I shortened the message to 99 columns, which is robust regardless
of the exemption.

Dave.
