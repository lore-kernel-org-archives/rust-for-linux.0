Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575122;
	b=qG4JQ6rxWfkcQOQeJfa/ZpMypnTsdX2+5KKv5aM6qZjScqlIFRGh5CYMHl6DSmalYUDZ
	 Wn7gveLrnq1HFEHYrwUBz5mMkIkFeN/TXC+Mh93mfP71CBkKbKVE/ZEI0lrk8n3v+Ojqs
	 8k7dQvGRAtLwCLoZbim3s9cfz8jXDW6hbYnzrqmVz3iXSPaQnxdOvpv3QqPZnxIugaqDz
	 mR+LBr82XlYytWcBT3Q7YNuZOShKIV39WCFQDG2dOPJ/oGwbXT9jFnSPSb/krInlP3Zx8
	 ctCrb+itNkTnO7rcnZL6yKefmHAdaGTB+YwFSrDNor5cChOqyG4Mhv5z0CTSdVHeVLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
	b=IiKKjE39KvDrko2jdD7GwsD7f3YGEvusNy91Sf8uFOue49feAcL8a3CtUTTmnJhiw2hF
	 HGA/4a3niZtmMDr97mTmHJX4JQWZ7Pm0li74hyu6VJGH1ag33xiNDDDOhtbXqptScdak7
	 VDpY/ClLnNUJgfp6FA80LGJ4J8Pzq8YLDqieqcYY2ruL2F7bRDZ0TJnmVdXEs+Lq/H/aP
	 1nT/wIaR/ONtOSeho9AZaMeR+uBuqZjyF30EJr8/BOrv0faKN9AON0c9DfuGj+8EB4f/9
	 RljEE9lBWLRUKuKs1SKm0XHidquS9402g1nCdTZeBUlYLkYLc0VhdOB30gG9dSbIykw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aq8IHgKx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B02606A31F
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B02606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aq8IHgKx
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso707088a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575121; cv=none;
        d=google.com; s=arc-20260327;
        b=PtVXLSXK+NLr1uiMCcGcoUti3t1ZPDQNi8YbGjujZCvAe4ohfdo4QsT3mNF2K7fq/S
         PQYrkHQOSfkwQv6YtVk+zPav5Wcn1sADCxsxZjP0siGe5mno842UJCZ0+tLZPRit+xF5
         iV9rB45cLiAX0cm0cgM2OL18inlET8oMg2r6LwF6FdN5daYPLgUYXGnYl+LlPR/cLZSE
         9f3FiKLLScre0fbHULeSg64G1m8yOzaZf3kCFi8XyqNimi+42zLBnTqnGgBPQR3u6edd
         pCvLp1MMTMBhCaGkeIvd9/oKwXI8s09vUtt+3WFWlh+qJ4uymx0ezVB2PUx2Flj5vPoL
         VZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
        fh=RHM+Ee0p7ZhSKM4bW9cx8IW4PUGN1JSPRaS+JQEZlqc=;
        b=I23U17a5KUr7o+Rke/MRvofX+TyksZRXiplEkN0T1lH8CmRXb0iPYYNePADVEY2zIx
         /DLoxl3b8dPRLfCTfUaXs8OzulIjXKpn4Zqtjffs9QnoZdsr/9UnFzZhiY/RRgXQM2WE
         ZcpG+TIbiWoxzzwNW95ysMYbj6ph35H9L86Zu49Qr4bTSliIlNpxXLjWNVxb68LdQo2N
         wUNdc8JsjaNq/JhIMIKloyqTmmjr4+ryeCKVKfLsWJh3HNZF92T4/43qhDGe1tfdrEm1
         hXloB41yw1yZCa1EBiE6zrTTibaLaqzcUzGs2fCKC//nk8wjn07gEwPgOVRRdKpZ/479
         mwEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575121; x=1793179921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
        b=aq8IHgKxGRR6sb/GSBo3BOdbUepLmLuwpdhhHG1Wi7UdBhXdVV+91Bnup5O2M3oF07
         o8RmkdCow85hLbijjaaLy/WPQeDtdA0SDiGlTaQE8RQPpoxEFH/S7QhF6hWcqzJogczJ
         KOt7zXle2sv0vQ2RTYj40VQ2eSi1EWQF9UK7h3nEFkNQyDtCFXS/SV7xFHk05MN+r8pz
         NQbiTG2amhrnuSvLw7JHbXPl12/EDNAXJ1GPlaC8gBVLSvNE39vsHnnVVz/5DtfhBRj8
         xi9TGz7ihaH7WCP2XaMacJo7JHoBIeJcCV5xDCJFaHEV2IAp7cGqxGiAd12b1O7XwJFr
         CJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575121; x=1793179921;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
        b=humD8IN8+DzXe7pGUlM3qpsJO2KJ6tr8Q1mbkOlhzilkStcLyTcywoRZ+pxyZDM10r
         Jnvsd6Dl6hvH3UhK0oKJD4d2RkxnEIC0Vp1nTj11XniO5zAfped70FppTKu5qoAsXpYh
         a5lLte7w89NwlqbfHxiDzBeu5/AOvmkzOL0R4ZnQM3fwMUjkcZrcJC0YtcqnDP09tRUn
         H1pldM2VozFKWU5e/jCc4cR5x32pEq9K10WTb7MIAJakR2/oJH0ZfJzpbKH+GQEJEAGy
         +1sSdLDL4b0KG9UzIHKLyQ466z9+Db/jV6d/E90Qtcf9Z8yaK8ugg4i0FlV3sMek3VID
         mP7w==
X-Forwarded-Encrypted: i=1; AKwUvBxFEsnHn+6SQNPIXc0y4EInKRjA4P+nwuwB2AA2QiShSJmUXKP9r6EaxADAQTTVV9mGlig3+90e/DXVISCurg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsw1oB6w42bdFC7dxMcXsjKMiknRPJZjnfxTsxUZGG+0ZEaXao
	fJbr4w4DabV1w2xpTM/knFHf3FzaCBzvkVkHtF3rbBRMnW6UC9NIn8MXRTH0lv4gH34yw+X/oSz
	FCVz4OEfZfd5ClMk0nOmp3L1IUZu3jA==
X-Gm-Gg: AYBFou22azUCPYP2EEVxKZbSwiOl2F58qRkF8eQcf9gCPn5nmCkYwaKLG76DIP92mZJ
	b1fQQNusV5k9w62QB1BGJqy+drs/1meRiLzWbjEQDIoLs3gYPnKi6U6Iamqn5IZKaPs1/wmJFbY
	7TmJ0vAF+JPEVB5Ia8OMWFIhn44VA19vW+1eGjDkOsSZfMrfZv+o/GHSuhAgS8daAP796gOqe6x
	OrVlzIRiUNbVaLUn12bCyvnuwKA3ebAWShhjFh8Rz8VGd8ZFrKMLd/oCvPNW/YRonTVsVditKi/
	/VRru9Yi/CORPQAUc8Oc5oinLRf747yeoCi8CUgSGMv9PTonFoVckHS/5g4X9gfa7wnXXEXEds3
	vqiQhVhaL/q+eg/q6ZSVrJCCU0c2WzwzXu/Tt2MoOO5s1tSVDdh+9P1Q=
X-Received: by 2002:a05:6402:2b88:b0:6b4:2f4:fc42 with SMTP id
 4fb4d7f45d1cf-6b408ea46d1mr825125a12.10.1792575120407; Wed, 21 Oct 2026
 02:32:00 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Wed, 21 Oct 2026 11:31:48 +0200
X-Gm-Features: AclHuK8pA9Yi9UIZGPbxVnTdYw78dkrf6R3soXchP7LX6uklxroFxJZ7GMlfwpI
Message-ID: <CANBuOYrCHc=HSe2z45EKXjfHqPO2Dzh7L7Atwrzboz9d-H=Lmw@mail.gmail.com>
Subject: ASoC: Exploring Rust support for codec drivers
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Liam,

I've been considering working on Rust support for ASoC, starting with
a small codec driver as a proof of concept.

I've previously contributed a few patches to ASoC and have been
interested in exploring Rust-for-Linux in this area. I raised the
subject with the Rust maintainers earlier this year, and they
recommended discussing it with the subsystem maintainers before
getting too far into the implementation.

I haven't found any ongoing work on Rust abstractions for ASoC
component or DAI drivers, but I may have missed something.

My initial idea would be to investigate the minimal abstractions
needed for a Rust codec driver to integrate with the existing ASoC
core, starting with component/DAI registration and callbacks, and
expanding only where needed.

Would you be open to this kind of work in ASoC? And is there a
particular approach or existing effort you'd recommend looking at
before starting?

I'd appreciate any thoughts.

Thanks,
Jihed
