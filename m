Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1A253B58
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455323; cv=pass; b=VKNo2x6wKjEm6QfTYyCKIxmVx+P3er6XMa+mncu2UzLktbyVDFPA5HvPPKMbRdQ/9cEYXMl4xj8a8oXbzO7re+/k+agNHHkJrr8Fymqj9rlg3XvmnN0Yszt3n8EHdcCAQHgRuoN/fk0X3K17PxdEkZhij4eIzKleGG361e2N1Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455323; c=relaxed/simple;
	bh=vuw732qMf2jkVrSLeOVD6dFD/8/WEX9xRAVPXr8U+qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoUgtd18gQC+l7YChZfTCxAGxAPyWo4/1nfirf+coLWKPY1uzFBRXCZ6Waj846sozThNZ8x65jOq19pzIWgbzfaLlGbt/A1tBIK63r22CaXtiDzYzY38tz6zH1XW+MR/X+th5K3UGE3rZc+KZhK2Pw3SND8is/D4brHeW/uiLvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyJAr6a9; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyJAr6a9"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396673bd283so734819a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 23:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455322; cv=none;
        d=google.com; s=arc-20260327;
        b=Ap4rc2RCEGdJUy7/60+PbjjIxeGtPpSSfdIDruzVx1y4gnSXgys+nyGJB0YCbuaeE3
         jUqpu6k+OchmXTG1Ge5L5k8maB4jYbBomOUbkyjVUVTcIjrTgCOCXqGtoX951g4f5BO4
         VCHFC2xh4tL1F1He+OFSY7209OTRPIpx8W4kCzbMDYHEV5YzhJxfJFbfKzoxMQS5vm0X
         C8BOq7HXvXEIE5aUoZQeivTT1zSg4wq1+gQ+7kjpSG3Bo3D0b2/faQm2mmx1JoawGdhz
         1mc7ivtc3+TcDW5YzccL+lrGMqQUFSqxVKfO78eTarmbFtk2Xd23zyHsdX/M+lw6yb8o
         Da+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuw732qMf2jkVrSLeOVD6dFD/8/WEX9xRAVPXr8U+qw=;
        fh=NIjl0d99RL7WLJGlRAp1lZ2oc6ZhUpFjvd3jhoAMRi4=;
        b=K7t4JhdXinMadOwUceKYsX9EgpKtrVMfOCSOpXzdVxKR+hjMbDj2DkC9ydHg0keG59
         R7dA2TzIwKjyj+laAWkhR8o71dV4UWUJ+faUJAMtKuY8sqatwB56YJFradtSVd3pUPMx
         nhe/ChDeUFGTrr7rxCmufwc5cmBFTSdN6wvOExalLLUzX7/IwFZo1xA23kYV0VIaUqBD
         FuFT+riKBu3fByiij7HGJO+vGT+R/cKSQJBSPyUSZkz1ylmDbfnztlO4WJyzaBwdpNyV
         RooHA7Bko/hmYzuH9YI/r44uKdl40aTXh2APax+gujItW7aEHpHUguJxfhNPAbLxY651
         MouQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455322; x=1790060122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vuw732qMf2jkVrSLeOVD6dFD/8/WEX9xRAVPXr8U+qw=;
        b=NyJAr6a9V8K30qiRP5CV9iYCrZvDm7EXLZtD657+qYi6WN/ObaY56kt3GhYTv4Ssrb
         VL7gyOnU7/OfKPQKpvRs+dSRSzXRkF2ISQLUUcb9IU9dWxGTCqVBDE+BWmBRhG5wPplH
         ZFYoQC3YfbcH1fz0yeP+7EGElUqGqwee/wqizj/dwNyqL817JMllWbUMZpWTrbKJIijJ
         sQl/tOb+FTFc4qXmrM6+FPuVVDcNoKSOWdPYW4SoLQ57WHiNVPf3lgbZ12E7Vls7APCp
         X/ThwcIj2b+6FB/B6LDgjyRfjcFeXBmkwWef3zN6xddj0kFDsPZpKWVgJ3P0R76bHIya
         X3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455322; x=1790060122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuw732qMf2jkVrSLeOVD6dFD/8/WEX9xRAVPXr8U+qw=;
        b=k7VnepWrtycXdOFSmE+FC6OZQteIfxCtf7bNzezoixb/EC/uwWzhIhf9XdyfSwStdF
         eN4IWSjpfDtjSxw7QXWcXKc/icr/fYQwue3CmmXk3KkmbCcRhqJyPrGt+3lQQ2ETRftE
         a2j1XeG+5Yg05Yl5iCSe5ODkD/F4/1h6ZkFwed5iAuGKhfxVOQwCAA4keL0XZiHDoEJc
         cT0+zHxagPjIY+uKvx0IMdlyEyAbWEte5KY3qh/Kr9mdcFhuyvsDxJ+5hmVdXRBkic99
         LPDl6ACkLRCgG32hnARAcgJ1xQlCSZSWpKofAwX/O+JSfUdZ9yRQQSp6NDAMPfSi4VWp
         F14Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7l7PbNEIcXRJAbUZD8vWgEff6IiTGr9wPeNlponNg5x60yjAsHf79HQygCpG6eG7164yUhl1xuc8tfBd+DQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l3rIShn/P5v8UXdXsLpCMyjf1ba5w363CmGkdpt7TfpTC8a/P7
	9Cc/cICnJOCdht9I1n22/F5n/UgXw3Rxn56334B57KbM/kuqt3JPU4VzxGO3LfmP2f3hpGUcoFC
	1mgwAsSGiexBVuZLLJKfx9BuToZKcHZHfJg==
X-Gm-Gg: AYBFou3iUZI7M11ZxYiArkI0sPhy0tlDi5gFSG9a1AMZ5lVVvMIsnWe606+PJrSucGh
	B3Cw/J8FwfMgMEyGMHCXJvYfiydFvKO8dPJfrxQ3SvQdYSrlYs64dMEhVJVs1V7XodkREsT2sqd
	JiXGL0J9GrGTzoy/o03BeyO92LFZsKoZRBoZD3J6GHilZ8qOor7cP+7LRmBqyiqXXMllPnX9aPC
	GHxOOm3y3JQvcrfjvJs2y2c1ZerpwNnF7QTTQGxPPuLXiwxA60tsBYBRXWu2hQ63GFv38at2MSw
	bUKAMAro7Oy24Dw2MIDtgCJyaX94U57M7l2tVPV1x+7Qci7WdVlfttkSw+2lgTCFQXuGfxt4drE
	u5wqBTi2Pcn8/EJ5AXd/Cex/7KiZ5uVMzQGiLDcN8WivMRy/wqm2DZLrex+YWCKLG+EQJyy+190
	jEPqjOuzOVhjMXMQUs2jOTk2RrUv7TaF2WiqaPWT9I8RqFhg3cHQ==
X-Received: by 2002:a17:90b:2742:b0:39d:e1f2:3400 with SMTP id
 98e67ed59e1d1-39dec24fbedmr8075100a91.5.1789455321609; Mon, 14 Sep 2026
 23:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789420324.git.pgovind2@uci.edu> <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>
 <CANiq72=jRupLtnQSnAewyZZC7q4-oeAVmA=SfBGN+z_nefsnvQ@mail.gmail.com>
In-Reply-To: <CANiq72=jRupLtnQSnAewyZZC7q4-oeAVmA=SfBGN+z_nefsnvQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Sep 2026 07:55:08 +0100
X-Gm-Features: AcwNN1URt2QYtF-NYmCB88MUGiPqFKp9kgIrbK78hsZ0yEKNcwWDtkaTsv24RvM
Message-ID: <CANiq72nPhNRxesnUQ3HKBxtfxUD4r5rPYVQOxbiOAvpEtzUrbA@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: block: Fix unsoundness in `Operations::queue_rq`
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: a.hindborg@kernel.org, boqun@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu, 
	"linux-block @ vger . kernel . org" <linux-block@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:39=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Finally, it is usually nice to provide a simple example when possible
> of the safe code that triggers the issue.

Ah, in case it helps: the cover letter was on my spam folder -- I see
you provided a full example there, thanks (it may still be nice to
show the key bits in the commit message, e.g. the part of the impl
that goes wrong), since that is what will be kept in the Git log.

Cheers,
Miguel
