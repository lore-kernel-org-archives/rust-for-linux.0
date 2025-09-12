Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2392D7385
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665677; cv=none; b=YGdijA5renIXELGd8uSYnd3oY6sOE7jF5kQHWjp15ZqInsHbMhrgv4tYXeYFeKcWZZQuvXZm/lr7cBrekEs8OWUXrPgNM654QfGGJEkx8uSd44xJkRy5+lkuE2KhF8SBf3LRxV1WxOuQT+nfMbwDif211d87K+uqlJWH9wTIOOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665677; c=relaxed/simple;
	bh=gyafARm2+5+HraSg62syFphF8W9ftxH5KWVkzqAeKV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPHCiwlGGI1tJR04DyOTaek2EaBYrapRTGWsOKacCSmlo0Yv2igZxcfR6tnLlpxX5aQAfACueDx3Rc0HaBJi/3WDdKMTjsKZV4ciY0xcPcC+wCOTnSaoJH5mazR5OACUCYGxg9czTgPMP/eB9GqgSsF4saJyi4G6gfGM7/j/vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsWZYBBa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsWZYBBa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24cb6c57a16so1891265ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 01:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757665675; x=1758270475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyafARm2+5+HraSg62syFphF8W9ftxH5KWVkzqAeKV4=;
        b=nsWZYBBaUNHzrN6FP4KdFo1Am/18J4tSRrl71pXa9B537UYPi8CBsuqjqif4UdFJAC
         97it5gZTE/iwrmAiuQnrnIcYthEzA6Elertol2jRC0mDyOT9Ek1ZOtc0UdDoHxOnOCo0
         4M3rb1pRe+VO7HxFicxULy+hWxXt2EHk04vKJ3VYIXRpBKveyp+5tR54vwS8NPPgUcOR
         umKrdLcqW0sHrq4CHroJCgTON+rAg6OQMY9INxaxpv1bZkPeJfo1S7zaWTMNPdbA0gFE
         DsNBH0iwycZH+1lGHcCv8Awvgb1fVF30iCQxHBCq+HknGpoT8JX5otw3JJgEr5nZekC+
         XcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665675; x=1758270475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyafARm2+5+HraSg62syFphF8W9ftxH5KWVkzqAeKV4=;
        b=NIGIsAfsHgh5eSbPvEzek0bWo0Ex4/vCrJYFxNCgay2A9j5Skv0sWlF4YvtCmf0Xuz
         rENd2i+SNeHrfpVcD2st6AZlEDGYDNQzgFamqlg9ZDJcnzTn76h/2gBuE/+LqhV+guAR
         T2zBCEukz4DRL7sseEQDQ53GsD+z+FDwJXW7KpCkyow70Tw/LrtCVHVxxKa++RrZyHX3
         VGqdTCa6V/vxses+Td7Oog7O0LHrZIA0AQTJmyELbEAzRcJWqZ1VLbSl7klvAOT27rQ9
         R8L577ypK3gwM2p1aaZcdJdSXLdk+GLEPtBBL9wVnqWTsQToTlhhEtb36vbJYIDIq1yV
         d5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG97t205BJiHKdybdtt8ygv+K4paE0nPjgNKgPDLP/rvn4JstX5Pr6gKJFHnH+niNjIdxUMw7GQIBBc6fn6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzknJcFgu1FOBL86AAzqmll/SbG/npTi3kOme1R9PN437DbA8F2
	9R1SVbk/3JFIC/VPbo43fB6lrXq/7/m6HSvgbNyRoQ+VibabNVAbbEWr1Gi1Z10ImbzK/HXyt1f
	UNMPPdqtoV+Ju2iUbO2VOF6Lbom6C+Pc=
X-Gm-Gg: ASbGncv2O1VgRXpxvMPBUyoGNs6TxmXa4n78aublLgz306q5Yh6rdcZyi9vweHMbB2l
	A1OYSV4CUQIY6ddADHEPD+kbI/rY0hzWdlY457lEYZ3/txKzo7atTCM5BKLBYsDUgL1o/+LL81l
	lMQD6QvYCKE22/YAibKmtw3TUPVUCi9yUT3Ebwm4Ggs9gtxdWQlxkeQOKcxTW0n2bW8uwTTd+W8
	QLO42ViCIZ8SQ+we3IbeReHYySJOazcBHTT3vMox7ffgnBT85P9/BobU0jjGBBYpMejk83XoCym
	yzW9+WliKNJhS2Alx7Gf9PyaxQ==
X-Google-Smtp-Source: AGHT+IFXtk/b+mBcCvYGj0Siyd7M1xdtwtm+rgr5hC4xpHP7Y4e1MWcNVn5VfaCSvjXJxZUU9Q7GdujGkw54EvBzg/k=
X-Received: by 2002:a17:902:c40a:b0:25c:9a33:95fb with SMTP id
 d9443c01a7336-25d26d4c80fmr12553565ad.8.1757665674856; Fri, 12 Sep 2025
 01:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911213157.GA1039411@joelbox2> <aMNo7qRCp_yprUAW@my-computer>
 <20250912025343.GA1376629@joelbox2> <4940aa5a-18d0-4bcd-9125-80f5a9920627@gmail.com>
In-Reply-To: <4940aa5a-18d0-4bcd-9125-80f5a9920627@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 12 Sep 2025 10:27:42 +0200
X-Gm-Features: AS18NWAksCJUI94FyECCBQ1v6323LDTQdfn2krc8zxB7QJ_YxljDTqr2dN0MuY0
Message-ID: <CANiq72kZgZdU4Dut3rmcWT-cujyJaP_99ekis_XdfQ-7LmgZ5Q@mail.gmail.com>
Subject: Re: Printing with overflow checks can cause modpost errors
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 6:08=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> The pointer passed is const so rustc should assume that the c side does
> not change offset, but looks like rustc does not do that.

That is not possible -- a const pointer does not guarantee the value
will not be changed.

Cheers,
Miguel
