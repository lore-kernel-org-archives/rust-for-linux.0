Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44808CA4E
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 01:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776906659; cv=none; b=iWdWBLL4vMZXf2lBTgX4lUtLhSYnP8jlSl/xEBXPN8RhjLVyeywB5ru/s/MB6Q/UWlhf5NSvC3yJ31PiXGYlpkPDH0SUqZuy6GNQ8aT/eeSDFLPwauEcI9V67tZwV+GvqgNmkhedQC98EzXyFLHHe2SYPyXkktq4ULICcIwhKQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776906659; c=relaxed/simple;
	bh=TCKUqN1L+oeWGd+2FBc6SxxONcudfRbWkD2XdJspzRc=;
	h=Message-ID:Subject:From:To:Date:MIME-Version:Content-Type; b=VUzryqUEk25UltV3mWVpydR3CLDtim0oU0lv0IW7cWscS8SnguUOnkxWpEl5Zo1T7YsxehL3UUE5nqCOf3fKkhYDogxBDi2fBbkhmwGAj3DniO1RR2mEEGun8if+N3w6A8c6TvemP2TYZ6NrOzPj7gXXDk6aanlW+wFfk0PxDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XcFEyAJd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XcFEyAJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776906657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TCKUqN1L+oeWGd+2FBc6SxxONcudfRbWkD2XdJspzRc=;
	b=XcFEyAJd4AaqaE4js3MUWAjY/2VUkDbMbPJdja5XXbTrbhxz1OLGxWQX2YAlWi0rG+UOZZ
	RcGAMhD8DIXwkoIehA7ex+/Yu+8W0XYYm7PvMs2oHzPfThAK2YDiJaS4QXJhiumWE2rZjN
	w9+3jCycqZfreu+NZ3PpzQ/9VWXz/Ko=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-UKOvctjpPsq0zhFF1X0xrA-1; Wed, 22 Apr 2026 21:10:55 -0400
X-MC-Unique: UKOvctjpPsq0zhFF1X0xrA-1
X-Mimecast-MFC-AGG-ID: UKOvctjpPsq0zhFF1X0xrA_1776906655
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb55e55362so790104485a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Apr 2026 18:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776906655; x=1777511455;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TCKUqN1L+oeWGd+2FBc6SxxONcudfRbWkD2XdJspzRc=;
        b=l7hm2iCuhFGo63vFGLBpEjhWlpED1IU2sMf4D8399Tua7Jyz0Ik09jiyoC7DM0B1At
         VRVKVdGHWk5mQOMgAsIqt7iXsANzwDF+LSb5vyIjV6Rrbx9QkzZiUyVuk0OR/PNR5i6g
         lUYNPDkeeAO/xU4UGd4DjQFjM6/XRNsY0v1wHrVw2etYEW/Z7bGI/f+uAIVPK2XlNxIb
         BsFRaIanDjLb0yLlF5tAmmZnVNKIcxPTFbvi6PXENojae+otNk0RHlfWOb7HrM8jkHtq
         q5Nu2vc9R+26YTXw3IDDzqU4DN60EYxzM3yb5YOIIWhLMlpLTd1RIsfNIaHFChA91Gw5
         nXsA==
X-Gm-Message-State: AOJu0YyVveytmaQaDRtK1s6X3P76FSxtxV5LbGrRvPkaVRgkshG9oB/8
	m4b/AMX2TeWG1n+/1m1SHHfdEFi7baXLN3IEyzb5TLXYPFdXh+pRDu6v2oTqPQquO3x7VTyx4jU
	F/nIM3/K9pvyre6KuvLiuAI7S+D+QUqYoZfVUleQw5yatKIzTcKKTsHa879EzXLwdjzm+ZMq2ka
	7kKABL/dgywSC1+MJZc12EurP0fuSfChqODNavtcRGcKlUntK0
X-Gm-Gg: AeBDievuxCe/THlXWZPFJv+4FcaFaKHUv2cX8FN6IVsXJEL5JE4iV7Pxm0MfSiP3omF
	fVlZaMhW7kEa+tSBJFNZn62imee1CnQpulG603YaUbsY3B1HxcQed4YPfC8BwW72tBgwzknQkrs
	MhyNVdU7V79W1qXcwciuS0yhTNFqMFJloVRS9pi5hx6PfxZYU9axJLPyWYjTMJVQT1x/kgePqti
	gwo9nxyjSy8MFZqN6Yx0pGqKYBod5n5Ci0r8ycFE7CpWQldqXgLqvT5+mICxVjgPOybbQDaL6PO
	rm18GPCHBmWBDJGc7wVbYscQDr/m1nkbWsi++t2JfmpJPSZEwP8uVgwWkpZBlfJUEGK2pD4UDU3
	Jh6RSdkvAo/RzKAiSoU6RMeHjE568
X-Received: by 2002:a05:620a:4084:b0:8d3:d63c:a582 with SMTP id af79cd13be357-8e7900159f2mr3448537185a.25.1776906655197;
        Wed, 22 Apr 2026 18:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4084:b0:8d3:d63c:a582 with SMTP id af79cd13be357-8e7900159f2mr3448534385a.25.1776906654658;
        Wed, 22 Apr 2026 18:10:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb61bc0d3dsm898726785a.26.2026.04.22.18.10.54
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:10:54 -0700 (PDT)
Message-ID: <2476c3b3f06bde0c376e70a3ca30e91f54b544fd.camel@redhat.com>
Subject: Maybe make Sashiko emails opt-in please?
From: lyude@redhat.com
To: rust-for-linux@vger.kernel.org
Date: Wed, 22 Apr 2026 21:10:53 -0400
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ybkny2GQLBFL5DutPJtCUfVMETDnzBxfYZgu63ArvXA_1776906655
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi! I was told on the github for sashiko that I should probably bring
this issue up here. (source:
https://github.com/sashiko-dev/sashiko/pull/112 )

I sent two patch series to the rust-for-linux mailing list last night,
and was a bit surprised to see that all of a sudden I am getting
Sashiko emails on my patches without having asked for them. Which
brings me to say - I really think this is a tool that needs to remain
opt-in. Or at the very least it needs an opt-out that at least silences
it trying to respond to a specific person's patches both directly and
via the mailing list.

I'm going to keep it short because I am really trying to avoid this
turning into a conversation about how I could benefit from these tools,
how useful people think they are for themselves, etc. I personally
don't find myself being more productive with these tools, primarily
because of the significant number of false-positives and the overhead
involved in filtering those by hand. I'm concerned that if these tools
are suddenly allowed to respond to people's patches publicly on the
mailing list, that it moves the responsibility for validating its
output away from the person using the tool, to the person submitting
the work - regardless of whether it's helping them fix real issues.

Keep in mind, I do want to be clear I think this is different from when
people use these tools on their own and bring that feedback up on the
mailing list. In that case you've taken the responsibility to actually
verify the validity (or at least the likely validity) of the issues the
AI pointed out. I certainly would have no issue with that and
appreciate the issue being brought up. I know a number of my coworkers
do this, and I've honestly not had any issues with it.

That's all, I'd love if this was opt-in - and not enabled for the
entire mailing list. Thank you.

