Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB416B756
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716911955; cv=none; b=d40ne/irYhslq4thH2XfYAFYCbMWhb/RA6a33gSpfGMDhqI475d8WQVMTcwxc4Ox1hkWDU1yAXVQFLpn0D8BJ6EuyYklc8lUOVFrTvTZRy6Flf3qGxjOv/Gpcw9tJg7GjKZori7UREzayCz0ZQdsiPk0XEafZPJsBx2FQfXcM4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716911955; c=relaxed/simple;
	bh=DnGp1ZxJBCWs3Cxf5UiaMabKHsJwLH0qdw+WMORJde4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTP2OTdE6/QuOlCQexqGg4ZkyjybSjPXZ4DyI9JqevHPcAedZhKS0YvsSNi3O+0732epAqKpX9pdvPztXBZ1mo0jNdR7XiwAupgAmIeGyXAQr1mDIbYKs52WQIzBoCgJKsxIqmeY6RfT4zoJvB3O1V2ctZoejdN18/IWtNO5Brk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2d3mEB1; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2d3mEB1"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c9b74043b1so523743b6e.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716911953; x=1717516753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7drlq+824jGOFY7LDV7oSu2XnqVIUnOVLp+7rUfR54=;
        b=d2d3mEB1oAxjZ9a68CAXvnf/O7Oa1zVAKbPiVuGx2tG3t2E1hpeBuJ5SrZrJ5NWIuq
         WwL9wA6nZpZCU8QPBr0sQYkL3ioI5A226T3E1TpNbyfDN/GwHjb/AEbIvt+rAXQXJzk7
         dsn3wr1H5eBzqfNJ742hQBw5LQ6edAvFoUHZX60xf9IAfX1IW/BuZO2LUraJuc13d3fA
         QQEi+m+XKwK/SfgjEbeGa16WMw5Dv3Lw7DllfBarVMPAn/SUT2RZuXh4Xg6LJz/qMUfU
         8xn5fG3Z8lgwRVIERjab1E5ur/lMzLvitj7Gmbo7Kgx4fBjrtYPCV8I5jRkNY5fv4MNb
         nuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716911953; x=1717516753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7drlq+824jGOFY7LDV7oSu2XnqVIUnOVLp+7rUfR54=;
        b=AZKrP9zimILwlni5eFlgMP1LTocAdoi0KkXxxneRoZS7Wifl3uNrcmobwcs77H4Ul4
         NrGOx4Rshqxbr8paMWVLcxR/CRDKnhH+AVOIpmO7IoLvM7jQjNzBDOlQaYMPfeiqMIKS
         yvTZB3e2THF25/4+ZbXnU0hOe5OUfR/SJv2OUE8AAPx8uMhBvHuvgCJXD6IbRwm5tHz9
         IPOpStbrP+a8EiPAeQnzhVCzZz2OgpAiDqs7qcVZo9P23jMLauO05d2TlbenbxeN3zBL
         TTdHS2TS1jawlOoqE1nvTBoLLJUnuicPtyFZzz7XI8w3VynALJuvOiDn/F2HLVGhQ2GX
         LEqw==
X-Gm-Message-State: AOJu0Yx3y76G8UxyhexnKJqV6JqUFmY9LnYxMCip0fVGLzxrt7R/vFaN
	T51rsl0Rr0YhI1oeiKpYCu1I8CE/9rCqBEh6ZbufJHVEyt+Hf4XV
X-Google-Smtp-Source: AGHT+IFcQxAlf7kqIlVPCFCXXdijQtGZb7aPgprpHtK81K/dlgNWKNTWXRMEHlRuTRAGcHUfoaDcWw==
X-Received: by 2002:a05:6808:6241:b0:3c9:6c0a:7a12 with SMTP id 5614622812f47-3d1a6111768mr12523348b6e.35.1716911953034;
        Tue, 28 May 2024 08:59:13 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad67d3b33asm35079216d6.5.2024.05.28.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:59:12 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 120051200032;
	Tue, 28 May 2024 11:59:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 28 May 2024 11:59:12 -0400
X-ME-Sender: <xms:T_9VZhKTdxhFKz-84QFNFKE_SA4xGqtza_-kkswZluHewOL8cDHzmg>
    <xme:T_9VZtLmmVHH9N1KMYoWYX3n-hKw_V3fuKJfBaNYSHyacJnuitVYq0n-xT0RmWsS2
    0Sfmx4LXsTSoP2usA>
X-ME-Received: <xmr:T_9VZptL4OA9GAMPX3n_LXo1MB3ZRufl5kI8HMyAZ6U5m-I1iLGJqrAwGVMC2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejkedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehg
    mhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeffjeelvedtleeffffftdfgleelue
    ehhfeigefhvdehvefgtdejueelgfegjeekieenucffohhmrghinhepghhoohhglhgvrdgt
    ohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:T_9VZibfNKUOMD6gO4S43gxmykUYfEH1AXWbAoGdMtVtoSbgoz4DYw>
    <xmx:T_9VZobrSr95dzsOGTvjj5rznTtoxe_YxfBmRhX9zRWagr3-faKWSA>
    <xmx:T_9VZmBI75aGdmnc1EjHvUHFy4spkmLqSqK6o6_uEBx6CqEYyP0Tsw>
    <xmx:T_9VZmaiBaqjzIey0Z_0elVE2Xz1RgsXAR6RfnMtyTUQdBF8-r_7Zg>
    <xmx:UP9VZkqWBqfw_lcDi3CfqHxfJT6aohsBbZC6ypQzMmsN_DL_5byrPopq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 11:59:11 -0400 (EDT)
Date: Tue, 28 May 2024 08:58:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Open Meeting at May 29
Message-ID: <ZlX_KOjdd65k9Jkw@boqun-archlinux>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>

Hi all,

It's time for the meeting! Please join us:

    https://meet.google.com/vii-meij-xpw

at 18:00 UTC Wednesday, May 29th.

(Note the time is one hour earlier due to daylight saving)

Again during the meeting we can discuss:

* Your topic here.
* What's new since last rc1.

Regards,
Boqun

------------------------>8
Incomplete list for what's the news since v6.9-rc1:

* Switch to use upstream `alloc`

    https://lore.kernel.org/rust-for-linux/20240328013603.206764-1-wedsonaf@gmail.com/

* V2 of VFS abstraction

    https://lore.kernel.org/rust-for-linux/20240514131711.379322-1-wedsonaf@gmail.com/
    
    and Puzzle FS V3 based on this:

    https://lore.kernel.org/rust-for-linux/20240516190345.957477-1-amiculas@cisco.com/

* ListArc (i.e. Linked List for refcounted values):

    https://lore.kernel.org/all/20240402-linked-list-v1-0-b1c59ba7ae3b@google.com/
    https://lore.kernel.org/rust-for-linux/20240506-linked-list-v2-0-7b910840c91f@google.com/

* DRM abstraction and Nova:

    https://lore.kernel.org/rust-for-linux/20240520172059.181256-1-dakr@redhat.com/

* LLVM+Rust toolchains are now available at kernel.org:

    https://lore.kernel.org/rust-for-linux/CANiq72mYRkmRffFjNLWd4_Bws5nEyTYvm3xroT-hoDiWMqUOTA@mail.gmail.com/

* Rust MC for LPC 2024 has been accepted:

    https://lore.kernel.org/rust-for-linux/CANiq72koT5wYrYDvEZdiz-_-BDH4ZmaKeRjg=p=81=m46Z+PuQ@mail.gmail.com/
