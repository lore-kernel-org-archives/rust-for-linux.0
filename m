Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74049823A3
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718025219; cv=none; b=UYt6xzyGrZ8xR3U/uzDHVjGkF5JxD9nXuZqcnYPMrij04UgcKCSaIYaRIze7KxNaBjZFZmX8Lwg223Ri02z4cT6VlTAeKpdMWd4t3GSIRNV4MxLamNPq69icakBqnD57mS/sMgccYHb0qRJRMKgpJKMoEGcftH32TTTUdJzRTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718025219; c=relaxed/simple;
	bh=nsXhx3WG5irVRbNUH5x9x/8ISK0iZ/skO5bQIE4u5Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S5CkgpC/P2kSLTkvM9BQKYgcI4dDcTamZoyIcStTaEphUmZwpdFDLjx7qZDnN66AqzEK0u6cx+h/jiT+bbH0wKDzwiFnh3ieqRS1zty/IDF3SWAmHxRdnKLfa7MYtEqTKs/sbqQhRoLrgwzPV/iVhj6Tx/7y6lm1YFk3H6jNXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LHWwsdGE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LHWwsdGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718025216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IrUlnMBlplzCA703kxl5+n8EFJwNGZ15Zmnn7aVwqoE=;
	b=LHWwsdGEBMWfvXO8s/dvF5COy34Vd6r91GulkaBXFx402Z6yrLTbIag3Vtr4JHBiLeoP0n
	KkYRrM1oqCqknWSt+dNDPGrt/1muxxLM9MfGW+P8PlG5IO+urH4LxBUEIfGDY759rryczC
	pAbMyzpIGduG40Sjx6uCPnvPfsUm+jU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-umeIpHVfPyC-Fv8sPNECYw-1; Mon, 10 Jun 2024 09:13:34 -0400
X-MC-Unique: umeIpHVfPyC-Fv8sPNECYw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42159c69a28so30024615e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 06:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718025214; x=1718630014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrUlnMBlplzCA703kxl5+n8EFJwNGZ15Zmnn7aVwqoE=;
        b=rVXfRME5rZBlR1KdaNennVhf410QZJILDkqZorlhvB1O/HqxxSzNl6Kao5AY6odbXS
         k1CzAUY5QX+vfhtnwHVv9YacD+JWStTAR48HPYW2xArTnlqfdWdtDzJP8KkUDvDZ7Ipc
         Ij44seR4eZTF2O4kM2voC2Ua6C0iAKaRNDnQriudbHUHnRJ5U+2y96JUBuhlTY7kdi+W
         AycORHL0vR53fUc1E8yxvX3RLzslF4jYzx65+zvRjhxMTAFMBYL3gwSxVYWiIIY1qnRM
         R6u9I643RKYTXS0z+GnKJkPTOw4+euQ0PRAyz+ETmtYMslhkKIgLIPTbIjK/1QOmVjxE
         +V/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAWKm9X/erh3GYR7telLIAEi776juGTwFfy8oJDEYKRH4gUpGgc7dBvflytbDzs3dHudrKtdBwgsGQp1qHa9wfrvmLI6wo9GViZxxk5c0=
X-Gm-Message-State: AOJu0Yy0JjSIUJTK6KQ4Yj3PC1M/X4nQPbvP8AK4KKRIG24/BNuwJQye
	qA6Qbi0u9Qtw+Kp26qHpZS8mER3yhPUn43XfUWaEDM8nvTJqJk14L/IduWlrwN4XGvsg4K2gdez
	6BLVoOtxFg5wNa8JTEveUdpBEp+Z0fjOuaCYEm1i26OrwtEDadkk3jwqtEvc+cMQb
X-Received: by 2002:a5d:4583:0:b0:35f:296e:4130 with SMTP id ffacd0b85a97d-35f296e47a4mr616306f8f.51.1718025213792;
        Mon, 10 Jun 2024 06:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhD4ZJw9Bi6tM7YL8PTv0XBgcF2TZ2fQnBusYpunX8Pj9IYg7YkjOK/PnV1JA0O8Mqvp52w==
X-Received: by 2002:a5d:4583:0:b0:35f:296e:4130 with SMTP id ffacd0b85a97d-35f296e47a4mr616279f8f.51.1718025213460;
        Mon, 10 Jun 2024 06:13:33 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f23c67e70sm2905168f8f.33.2024.06.10.06.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 06:13:32 -0700 (PDT)
Date: Mon, 10 Jun 2024 15:13:30 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, wedsonaf@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <Zmb7-jUfxkNd0tJ9@pollux>
References: <ZmMMMyi3uXTFtIae@cassiopeiae>
 <2024060745-palatable-dragging-32d1@gregkh>
 <ZmNJpQbTtFUPOkAJ@cassiopeiae>
 <20240608.082806.872238171846642664.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240608.082806.872238171846642664.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 08, 2024 at 08:28:06AM +0900, FUJITA Tomonori wrote:
> On Fri, 7 Jun 2024 19:55:49 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > On Fri, Jun 07, 2024 at 05:41:11PM +0200, Greg KH wrote:
> >> On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
> >> > On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> >> > > Anyway, that's all hand-wavy right now, sorry, to get back to the point
> >> > > here, again, let's take this, which will allow the firmware bindings to
> >> > > be resubmitted and hopefully accepted, and we can move forward from
> >> > > there to "real" things like a USB or PCI or even platform device and
> >> > > driver binding stuff.
> >> > 
> >> > In order to continue I propose to send out the following series:
> >> > 
> >> > 1) minimal device and firmware abstractions only
> >> 
> >> Sounds good.
> > 
> > Just a heads-up, I'll probably send this one quite a bit earlier than the other
> > two to make sure to unblock Fujita on their PHY driver.
> 
> Please. The sooner, the better. I need to send the PHY driver with
> these patchse to netdev.

Why do you want to send those patches to netdev?

I think nothing prevents you from sending your PHY driver to netdev. Just add a
note to your series that it depends on those two patches.

How and through which trees things are merged in the end can be figured out by
the corresponding maintainers in the end.

> 
> I'm not sure what the above "minimal device" means. If you send the
> original patch again instead of the patch that Greg already approved
> and the discussion continues, then I proceed with the approved patch.
> 

I'm honestly getting a bit tired of this...

1) I fundamentally disagree that it's a good thing to fork off patches that are
   actively discussed and reviewed on the mailing list with the objective to
   bypass the discussion and the review process. Especially without agreement of
   all involved parties.

2) It's at least questionable to claim that your forked-off patch can be
   considered to be "approved".

3) I really try to help and already confirmed to send out a separate series with
   only the patches you need as well to accelerate things for you.

If you really want to help with that, you are very welcome to get involved in
the discussion and review process. If you don't want to, that is fine too. But
please stop adding confusion to those series by forking off patches.

Besides that, I also don't appreciate your attitude, trying to put some kind of
"ultimatum" on me.

- Danilo

