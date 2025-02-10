Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA246B8
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739156531; cv=none; b=O3FucMiBP9mxIWrrc4IIgx87JN9bKLFUzfSA27SQsP2WoLfIgHCeeFPmcdfxqKyd6aIDdDhki8H7lpbXtJ0E/qO+/WEjb9lddAer8pbNkLIl4ws9QxIvU4ikbQEcsZ/dxQUiCuoFryTSrHixoff0i6Jo/cnuZnEtKljOc7wTr9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739156531; c=relaxed/simple;
	bh=ntsmlY0jpVX4Lm1eK1BI7ZOaVIn3coY8rcFBvAwAGOE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=eCkvzR67mwdpoyKD52rnXRK0uMogKn0Vz81alBiF8FrjQB3b3zeIQp2SoNIluak9nPCpJFszmYB+bkBDhbOlNv5QFYIaSDWuJ+/ZEp6N2q/jWQPOR2fu6fPKBac0jbozWftGJ2sRH4QLjoMamfTd7FOPbc247o1sU3sIkXwYBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6FfSlpQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6FfSlpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739156528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=SS5Smp61Ec5KdkvJmSkB2J4L12nhkco2Uk0Cj2ggrLk=;
	b=Q6FfSlpQAZsAS4CheI3hGV7WOhBPNHg3LvKrVkKjD/8IQB75+Oraa9Tdlj0aQCbZ+a1F4/
	0Z1K/HGHnQ05QZ5zatjp9H89Nc2Zv3kRO7l7Ph6dzWEGauAWHYh1rnX9haaEYvLZKBaO4c
	fPM9c8tMYz/IbVBVugKNYoxz4nYEORY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-D7AHz5XDNpiFiVMYiPX-_g-1; Sun,
 09 Feb 2025 22:02:02 -0500
X-MC-Unique: D7AHz5XDNpiFiVMYiPX-_g-1
X-Mimecast-MFC-AGG-ID: D7AHz5XDNpiFiVMYiPX-_g
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 362E6180099B;
	Mon, 10 Feb 2025 03:02:00 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.86])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E2E3180177C;
	Mon, 10 Feb 2025 03:01:58 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 51A31oe03267208;
	Sun, 9 Feb 2025 22:01:50 -0500
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: miguel.ojeda.sandonis@gmail.com, eblake@redhat.com, will.newton@linaro.org,
        eggert@cs.ucla.edu, linux-man@vger.kernel.org, dakr@kernel.org,
        tamird@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
        benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
        tmgross@umich.edu, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
In-Reply-To: <iocqkifz6dsywt2ueqppsdw53bgcp6i7ju7vadxxxu7pow6w5c@n2wqgypsiq2d>
 (message from Alejandro Colomar on Sun, 9 Feb 2025 00:35:55 +0100)
Date: Sun, 09 Feb 2025 22:01:50 -0500
Message-ID: <xn1pw6o63l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Alejandro Colomar <alx@kernel.org> writes:
> On retrospective, we should have added some more details to that commit
> message.  DJ, has the requirement of the size been lifted?  Was it never
> present?

The current code checks alignment but not size.

It looks like that was always the case.

And no, I don't remember where I got the size requirement from ;-)
(but at least it says "should" instead of "must")

