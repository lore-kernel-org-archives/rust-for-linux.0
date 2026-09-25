Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6D3B6367
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357500; cv=pass; b=qluU5VT63Ni+szBNIzm95n7So8MZhHrkAWAX8/gXss9lC3SJ5fsIkULdDnVkw21M5rOANJKav0OmYz6VwYiKW7C+Nu9fmGx0jaPvBlixJQXcXG/5V56ROzUJFT+pnL9YyglznULyRor85SnbKV2CfUnSUv4W4je0iDtB03y0Sag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357500; c=relaxed/simple;
	bh=XxG9Il8BHKFfnFz2YfkjJII7znTAebbJDm3qkhBQO7o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fzbZsSmUsPC1nKJUpAsU5+Niw2qvqoM6q1RZtw7IYm1FLvaxgxV/yTGPSAJytSCJTucLe2mOmiyEr4L46iNgn/6tZ3ACmlyIYeRzchktNpApkOt78t7Y/J4sYEDye5dczF0xNPnag7Bgf4Ff4LbQEoR1rjXT1TITXpItaewo9hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0ze33TT; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0ze33TT"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2d5062bcaso323426137.2
        for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 10:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790357498; cv=none;
        d=google.com; s=arc-20260327;
        b=CS4vPpEcgvta3jXeJLu3HViMALHqO0qXdRz7mP2K3pSD5mvy9dqy/SfIQKgtZDbYBD
         QJj4DebAbXy0yrB9tS4yGyTd9Fj0zk/iaD+SrC6qAKXxVVE/Ef7yiM0/k5vSKOzsAnFh
         q9cisQwL156wdTM10pkyJaJlossLgnkIKKpJms8X4bOvKA4R6tj/fbaSQdR6xGsxx0bG
         cT0Fw5rUc413p7oeDrZQRaS5xDN0NXV+dxRtj3BjvvCLByF/Dufi8aMNjty8sLdQyfaO
         aDOW295JC8obFY4GqYMnvxhWnosXaqDgK9jqMyu80ZwMd6YXM42ttkD3qqEa4/CXZkTp
         mK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ddicWyOzYIx89ASi6sdXvUcEXhf49ozgWX7i91Y+zrA=;
        fh=2gAY+jQEkqzCloVObggV/8tg3PkrhrO4dpLwvmjpSFk=;
        b=EtEjqDARO+nYIlx6Y7Ns8c1aAGhaV9B/BHv0Bnm46vy79IijGeDnbtE1ofOOiLbkrL
         3dmpoR5bE/7hBnl1KVdl3ONQay8WEDKt9z0MXHko8FW0OjkQk/RoZ2dUDG4611BB1Rmp
         FOyWXeGFOTKoj8/5+nHmRbrs5wEA7EhvrF/9et7SZmXg3T7Q70HFD9dxHon7CbqhIaSh
         AvHV5k9eDi5veAH1XWnDYq2rNK/r4iUml25grLa3vLEhP5Dg8HTNvw8yd3UOFgdBVAVX
         WoIT3pM98LAQ3XlwCCscm2rgj7b42CgZCqoz4HldO6fpWVP86rWuLXM6nfRw6ggYMSEf
         nHvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357498; x=1790962298; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ddicWyOzYIx89ASi6sdXvUcEXhf49ozgWX7i91Y+zrA=;
        b=R0ze33TTVfgvBvUXatMwe2TXrl/nf6SYXKcSIqaFdjHvZpcDtDNmYhdCCF61fS/rqL
         bftYPyL1Opy1EFQbCckbPpJAogoPJ2DeNLZrBCVUu/iXcUufRn8lmYcZ0r2H0ESqHgkf
         3AfCrds1AqqIhI1V11V59KnihQgw/i8iGxC0wdM6VuQjzmVodYwdpVLw5pVLKWHW3wbe
         EXpl5Z/gjOaOXY8VaJiKcmsUFqjT/DJnz6LDGKOwtGW9V9oYiREzPE+M3k4Xzn+Q29/J
         AYHr7PUGQ0sW9sjcbO9AWDFQ4lPCw41VaA+36wPrn/sHqRrK2VEB5yj9o2Id5li+9K/l
         mblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357498; x=1790962298;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddicWyOzYIx89ASi6sdXvUcEXhf49ozgWX7i91Y+zrA=;
        b=KIUfbGqL2a+WpMain4bSLAWrYL6+Dyfa/PM6aiGhwgZeKSFGjOXxYOlOwex2sUGuTP
         jFJnyMadS2mFChiSfBQ76GAQX8jrUVdOb69kASDX55O+k3nLNRltpSWedqiQwAmiHNAq
         zLGNims6GCPmykoJP36KdZQ6yQKW8niRxH42tOnlHpUNTmMgIeFqjIc1f2jhVnAR+ea9
         /hE6Y1XZvs8ctNdQgR8eizWMfVSonT0E0kx7rgP9fvZv4JwiCdoRuSS9ZZZxQnrZfDl8
         YCpY+zDNm/Gzz8XGSlMRMAeqQDK3bob9jAc9p8lbfm2RvVKZC4LtCG3/AbaffjoHfjEq
         RpqQ==
X-Gm-Message-State: AFuF++nqWJ0lC9vDOMPtMWgC8kArql05WdQIVwEBeAzX3g0/IZuyEAlx
	i9jtJl9EvTzR6+noLVGWuF/cUDdJfng2CuuHU5S3P3yhu1mL0YylsrtI1EqUnox7ysnbAL5czZB
	AyINIgtogrygfMZTl+RYedo9SQCNOZ7v3QrCX6K9mXw==
X-Gm-Gg: AYBFou0IHNttvp1FstVl/G4a2FPiNMgYWTW+XUTpMjixgbpe83uHxtqkTuWnmqp/swb
	RkQBOauIY3BR4bQoNze2L3aS3zxCZjvx8op00gPY97JqhdHNsDpJNWHwXHG8H5mXSUtdBi5ciRg
	u/Dh9zm1K+G5c3lirmQo/m9vMyG+zjY+TKBPUQ9CsJDZn/nI42GLfXQrGysp2JoKRBwPj/etS7S
	3SyjgjUFZgB6/+ZswevcHihWHJ/OUSddJetRIzU1z7UWaTull9tvMVtp66wfBCKTVXs1DRqnPnq
	qLYi8t6HqSdAsHl28LBFslJQfK1G2OwoATVPRcUce5QL3iIGwJX/5YeVuJSy/p723+TrLzIJxiv
	/xuKYQHHAg9Uk
X-Received: by 2002:a05:6102:8645:10b0:7b2:3925:9587 with SMTP id
 ada2fe7eead31-7b23925a3b7mr830992137.17.1790357498399; Fri, 25 Sep 2026
 10:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lane <software.research.development@gmail.com>
Date: Fri, 25 Sep 2026 12:31:27 -0500
X-Gm-Features: AclHuK_lhUCc3_23T2DIUj8Kf6LDajT8arcUXJlnDm4sSKI4nQg0l-Chase_jn0
Message-ID: <CAGchGNvUS43DJGdFoUCUtvS+Gk64=n+GPdAyt+0=n6ejAUhFRA@mail.gmail.com>
Subject: Searching for net subsystem rust abstractions
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Hoping I have the correct group. I am following up on some advice
given from the Rust forums where I am trying to move some of my LKM's
from C to Rust. These LKM's,basically create new address family
protocols using (for starters) structs and
functions like the following:

    struct net_proto_family;
    struct proto_ops;

    // Add a socket protocol handler
    err = sock_register(&proto_family);

These do not appear in the kernel crate. Per the
submitting-new-abstractions-and-modules section for contributions in
rust-for-linux, the second bullet point says to "check the mailing
list archive" because "part of the work may be already done or in the
process of being upstreamed", so I was hoping to see where things
stand and get advice.

I know the goals are not to duplicate or rewrite existing drivers, but
my modules have not been opened up yet and still going through heavy
development. I guess I am looking to know if there are proper API's or
abstractions for the net subsystem, otherwise, I may want to start
looking into contributing. It is also my understanding that we would
not want to be directly using any C bindings, rather, using a Rust
abstractions layer.

Thank you for any advice.
