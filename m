Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4539D477994
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061038; cv=none; b=vFYNydhdcDdv80Ui4z7HcabIdiWHYh19pPUrZupwxqyMQJH/ycHl4dd4+1I/+dv3j5PBe1Enu4adNw0b0lxPLdfnATCNgtqPxJAkXnQB3/D5pFDfr6aN7k+awGSnr9WL98BCNh6kmwk0pexdDICqf/ueml1KBgZc6ClltxDkj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061038; c=relaxed/simple;
	bh=rcL5RkAfdAy7dDqYruwTt4GH7hk+TYk3A3NhMEayCv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s2yP8QTfrZFjiS/klusKNLdSfQ5riZjJ0XCyX1CyZvRx6zH9NkdJlqSPZXXO4o5jzfidG5KAfG1oTWsC8GoYgQpVGzhysJ/1UExSVnJyA0XghdZ1UR7y3WOI/By27umr4haXOFHdJjr8WxOyXJJ3U3WZeUtAH7uE6Zw55ou/X0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=c2iOTdgF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="c2iOTdgF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7A49A411E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775061028; bh=JFFUNrPgkIWIZ+e1f1sCvaHB/NjK1llDtyh7dRwJBBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c2iOTdgFIdDzOU6Bc5O+EaaYINGF/+K5UuSatLED5VNT2mWXN+3KSIVAz2ln8jJBG
	 EKXlsOVx+fr0gihbzZQcENXe+Vlpb1AHTHA+5Q9G5oAqqpLVYe3rRTWPQ2anMLPh1y
	 lvF2Ma2tINRESkOefS/FK4JW+T4s2nycEaG1Iv2UwIrOevYNn8RWc4f2WqG3g6HmpT
	 Irho1ihya7ZUxZCogTKwT8aMOcN1vxFDo2VYDYBuapCa2yk230sOudEtirj6zG/5vZ
	 wKjUGLx3MpGgCHlhyF8x9two8eTevddeN3YmEw3dh8ITaCMTRQS6/8UI0SaEmLwpmc
	 PuYz475WpDmPQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7A49A411E5;
	Wed,  1 Apr 2026 16:30:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: David Rheinsberg <david@readahead.eu>, rust-for-linux@vger.kernel.org
Cc: teg@jklm.no, Miguel Ojeda <ojeda@kernel.org>, David Rheinsberg
 <david@readahead.eu>
Subject: Re: [RFC 07/16] bus1: add man-page
In-Reply-To: <20260331190308.141622-8-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-8-david@readahead.eu>
Date: Wed, 01 Apr 2026 10:30:27 -0600
Message-ID: <87v7eaiqxo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

David Rheinsberg <david@readahead.eu> writes:

> Create an overview man-page `bus1(7)` describing the overall design of
> bus1 as well as its individual commands.
>
> The man-page can be compiled and read via:
>
>     rst2man Documentation/bus1/bus1.7.rst bus1.7
>     man ./bus1.7
>
> Signed-off-by: David Rheinsberg <david@readahead.eu>
> ---
>  Documentation/bus1/bus1.7.rst | 319 ++++++++++++++++++++++++++++++++++
>  1 file changed, 319 insertions(+)
>  create mode 100644 Documentation/bus1/bus1.7.rst

I'm really glad to see this documentation with the series!

That said, a couple of notes...

- Please do not create a new top-level directory under Documentation/
  for this.  It looks to me like it should be a part of the user-space
  API manual.

- You need to add your new RST file to the containing index.rst file for
  the docs system pick it up.  That, and some things in the file itself,
  suggest that you've not run the docs build on this file; that would be
  a good thing to do at some point.

As a nit, I would also take the ".7" out of the file name.

Thanks,

jon
