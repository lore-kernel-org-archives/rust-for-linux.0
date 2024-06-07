Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A018059
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 23:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717802909; cv=none; b=QtqA8r/oslrHMoNgYQFZyaBnuda8eh9nWj3whpsI2jgPVYKBMzhnSc5tAe1gUPd8A5vFYeLI6g1cUwYSzfU00Fo3ZmOdex7fV+x44fnxqbx4aTfcup/1ePstJa98vzSaJf4xg4rzYn5PKqi3g8Ai9eI+W1CtQCLdsKARk4SAW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717802909; c=relaxed/simple;
	bh=LdcHXq3pzhJ/k2XjNOM+2FodVMNzTKSke9sg+KAzgEg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TTEK5xgJqsZ1Atc3EQnu+h7mB/zswfo4siAvbJ90GMKRgwGk8JO/YykXcnkqcuBqJysX+ow1ySOwJJhO/pclqW3LnkxMfhDFBYbspE6iVCeEn7xdEPJvEw3kAi1bStDjcbsLqWxWbjDxNKJ5xz49qNMm2EgUkibrIZLdDExO4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ1sE5f8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ1sE5f8"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6dccc583e89so298429a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 16:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717802907; x=1718407707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCpSnT/Z3gu96TW6Bi5jW20jSUnyH6/NiGyW/o29kp4=;
        b=lQ1sE5f8gXFPq2zraoXf7AptbTG4cf5mnkCXXEtBecc7D2oFHZq8K4DFYQ5Z+c3/6T
         9Jpeh2CsL18QZG+wl/H31ilPmtbGW4BWEFlDn2OdwLMsgarL6Y4G/tGHRRHzyKbIh7NH
         DoyHVc7Xs3cQxjCbu548mgsHNmj+UaO3VWex/+Kw9mIyrkcIoh/XREZyYx8QwkfhKgj3
         X6mVewCUReGNR+xzNNXktgzgcK7Mp3wwiq+9aHXuctCrommFNRqvuW8duNvIUp13SmCm
         F6A47w4LbGI0SJYbaDHWiPvV3wKBNxxlycMvQGpRLG2jy8qGs+OVEOks4oMPezBkyyJU
         +0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717802907; x=1718407707;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FCpSnT/Z3gu96TW6Bi5jW20jSUnyH6/NiGyW/o29kp4=;
        b=HNER0yTXBusZILMvNUYDETGVzxsvIoIZ3580j0J3bWlqWqvOd/NiCZwuwq9zA1jmdO
         Hyi1WM/uS/gMSGYbAFj2V8Uzw7dx+oQvAAMC/ZqBLf5MZ5r+/TRLO+UmNMb6Pu0ziU2R
         4+tlnwHBrG7x8N4BRrJYMpVd07DGRwNek/YRanVyNyBj9AvjX7cn4xqUdIuLUrWh+kAM
         XhVIND/jKBRMubeQh/Vgi5UCLCTPRMPffAuaCfXrLafCOWXMFIUDEymw3PPqAb8zgZno
         s2lTiZ2V7k3MXF4vuBFo7dtHCOkSB1FTVit5GSRKmC7mu5MnIZsW9Sa0W2jJLxn+H/pP
         Pb9w==
X-Forwarded-Encrypted: i=1; AJvYcCV/Y52i06HctaJZlEcPKjajHrtN2xpa5EzSNoq0PrjPuKJMXVwkqDjCTnJ/QpmCG4bWscbAAKo0kbUjnsAr81lhPontCNa7p1edEIH+xbc=
X-Gm-Message-State: AOJu0YyJ3C1pgORrokSbVlh8VRYP42QJTpP6xeJPNF+e5x0bqjw2BRB4
	pHSoCM66eJIFzwGlejEoPnDB+6d1YLcv84J1jgdUpf/u9GNSnGJa
X-Google-Smtp-Source: AGHT+IHKqP8BpJ3GvlWBCtH9BHSef3p/eg8WyNZ0fLmpTYYkVZFK8lROhnr7aPwhZgNBRJIsfeTjWA==
X-Received: by 2002:a17:903:2308:b0:1f6:ee76:1b35 with SMTP id d9443c01a7336-1f6ee762403mr9866665ad.5.1717802907232;
        Fri, 07 Jun 2024 16:28:27 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f157sm40102215ad.18.2024.06.07.16.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 16:28:26 -0700 (PDT)
Date: Sat, 08 Jun 2024 08:28:06 +0900 (JST)
Message-Id: <20240608.082806.872238171846642664.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: gregkh@linuxfoundation.org, fujita.tomonori@gmail.com,
 wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZmNJpQbTtFUPOkAJ@cassiopeiae>
References: <ZmMMMyi3uXTFtIae@cassiopeiae>
	<2024060745-palatable-dragging-32d1@gregkh>
	<ZmNJpQbTtFUPOkAJ@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 7 Jun 2024 19:55:49 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Fri, Jun 07, 2024 at 05:41:11PM +0200, Greg KH wrote:
>> On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
>> > On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
>> > > Anyway, that's all hand-wavy right now, sorry, to get back to the point
>> > > here, again, let's take this, which will allow the firmware bindings to
>> > > be resubmitted and hopefully accepted, and we can move forward from
>> > > there to "real" things like a USB or PCI or even platform device and
>> > > driver binding stuff.
>> > 
>> > In order to continue I propose to send out the following series:
>> > 
>> > 1) minimal device and firmware abstractions only
>> 
>> Sounds good.
> 
> Just a heads-up, I'll probably send this one quite a bit earlier than the other
> two to make sure to unblock Fujita on their PHY driver.

Please. The sooner, the better. I need to send the PHY driver with
these patchse to netdev.

I'm not sure what the above "minimal device" means. If you send the
original patch again instead of the patch that Greg already approved
and the discussion continues, then I proceed with the approved patch.
