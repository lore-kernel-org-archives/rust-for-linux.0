Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE62EAB71
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901752; cv=none; b=K59FRpp4wMSYTNlcTgmYooCv6nAaaVaJ9NfUcWICtmrmGgAYWJXF9CGAMaD6ihEpax2YETd3/AJ1RXYY+ZZ72DUkl6yTy3Dv18r+1OyLks2C6A1f1KLUz36/Iwvc6TTzKrQdWCN4emuMkHASGLOS1pLIrGxXKp6XtsbBVfC/AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901752; c=relaxed/simple;
	bh=no6awPYlNWD2ZDTvcdrXtI2J2BOWdlGtNS+ynn3kOI8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=loLqoF6QjFThg/I3eSdm2QOkbnq4fGAjMUi2vIMqmniBqh3Gy9jEMY4k9EB+JSh1p5z84+8vtuUWWYDGx1n52DqKK3DQMfcUwlA2mUfPTjdNDZ6EN7+0A3oZtR4TUXMokaMHj8ldmscj16TpgTL9W4RfR11lYKVrvU/uOCntXqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0ZuW6pj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0ZuW6pj"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso239363a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 14:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762901750; x=1763506550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WV8SpjyToHnox8eW+EUZvNmanBSrZ2+/14Ld9cc4nK4=;
        b=O0ZuW6pjtdjLnJdOtcZ8Nh7lLY6eApabOp/rqBpf0rzuyPrQarGOjciEx0T/T4vWzW
         PnAWOMuIEBR+Q52aPh0nc26J7M0Y2WkCEKi1ZCOBlyCkLj26fiNzlcOFhJaPYtHnsmA9
         DLHQsr4ddq/bTHqSRVFC6663AaOYEZaAMlluRHlRyPr1ii+ebKNUyxPFdfa1kceVZl7H
         FsT5HISWcVLRCljY/0dbEO/kqIwITHikuBUBVtC+/t/vtHbNHEyAbDSrn6oEru62216+
         j/1ImsnLZDyGuIgyGuKwvgSqs6bUE1CDgOzLhQJbQHRF9yF4+tZpZF/aFPIdmkGEz42h
         w4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762901750; x=1763506550;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV8SpjyToHnox8eW+EUZvNmanBSrZ2+/14Ld9cc4nK4=;
        b=BWcrXosIOWhTNbfgl3zepvm5gNBkCxYO3bflN5wJD7DQCyJgGpA8c9wWMg3PlVse85
         5r7ya0sWA0OjbZNiOuCUs347dhGRhL+NYG/DGMwo4T45zMwKUCKsxFf5GBVg5CuvBkWu
         9lB9EbhtwuxM1BIadn4AOZyZDow5raXv8m3x/+g5MzJ4CuEQeZ0lv6JB8T5kTqPcIwOS
         7QoUcL3f7hyLtm4gKIfc7K084PhnJLiW/9j6yaR8mu/PSxJ+hhjoH3tZdOOyvRm8vT/Z
         PCxJHuGA4Fn+ywv4bJsuzFBlw+Bs0PsoJrdlkH3R8ZPHYFebPVmGparevABkGWpZP+xH
         9mtg==
X-Forwarded-Encrypted: i=1; AJvYcCUmgI9WFKxFIRhA7cAE3HNtkdqf9gs8cv5NuqmOOcoPJL0FrPInctKqJGIOeNPjoT+zDRA7rV7xaQNB0R2zYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykaA27dymOh/68LwOEFUMLVMdf0SS33lNpLEgAwJVJXe6kh5kk
	vHEMJqHhYGyZqZZIp+ZUGve9DVOF5iajcbomzdzfsKZSbadS9ELdu3Yx
X-Gm-Gg: ASbGncuhSaD+qASARYvn2fRmibFAl6fwzJDS0le19+RY2Zp3dnjuDViHx7XlezgDwt1
	2tWpZqt1yDE+O60WqwuygUmWiLqJ0NH8P4jn5QSltYxdQb003lQ9/dnhTjKPmFKAg+KVlixle7o
	8oa+mcQCorML2YN9NfgEh+q7oDloRXjMA969RPhv5PGvTkUR+0/17Djhl7grqbBrezi1NKPkP6K
	/gTxzssev41aqybbC7iiGnAErSkgZzZymoVBN1oBenYzmqSwxuyUBiiwOC7J0JK6/z+Q2LSoCdm
	dTJe+mjZl9buxTsjR/EQzH/XMWC4Rs/QbjHVxGnMuQYkepHZz1yrWDjA/QqTV9i+VOQCOsyY3N/
	Xh75bDt3u/cXbUwOStDKmBT8fCofjDNLQgsJVj9Mqu84We6sJgh7uBRX2ovuZSrsvWIPuF6HDTK
	VU06jhmzBzlXCHRep9Y79EBzXCOpphkPY4sC4Fo4oPIPo7CrSd7vvBHp/AUBGGNz0hKOrM0DjSj
	c0=
X-Google-Smtp-Source: AGHT+IF4OnkRMbd6m4HrTuqN+m+jnjr3E5I1/MHuhkYwY6fxfKQpu9u5zArrBIuDS/wyoE+OqOffGw==
X-Received: by 2002:a17:90b:1b0c:b0:343:7714:4c9e with SMTP id 98e67ed59e1d1-343dddeef91mr1097421a91.2.1762901749896;
        Tue, 11 Nov 2025 14:55:49 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07156absm214042a91.5.2025.11.11.14.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 14:55:49 -0800 (PST)
Date: Wed, 12 Nov 2025 07:55:34 +0900 (JST)
Message-Id: <20251112.075534.1069241481796218298.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 tmgross@umich.edu, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 dakr@kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 guillaume1.gomez@gmail.com
Subject: Re: [PATCH 2/3] rust: net: phy: make example buildable
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=_KAgUZ9u5YY-iw7kyA9R1Nv6eNzZqMLSwOLQk6sR7kw@mail.gmail.com>
References: <20251110122223.1677654-2-ojeda@kernel.org>
	<20251111.083413.2270464617525340597.fujita.tomonori@gmail.com>
	<CANiq72=_KAgUZ9u5YY-iw7kyA9R1Nv6eNzZqMLSwOLQk6sR7kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 22:02:26 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> I think that some code begin lines with # for use lines in a "#
>> Examples" section, while others do not. Which style is recommended?
> 
> There is no hard rule for all cases -- we typically hide things that
> are not important for the example (e.g. fake `mod bindings` that are
> used to support the example but aren't important and would bloat the
> example or confuse the reader).
> 
> For imports, some people prefer to see them, others don't. Here, for
> instance, it may be interesting to show the paths (e.g. that the
> `Device` is a `net::phy::` one, or where `C22` is coming from), so we
> could unhide it. So up to you!
> 
> So I think the rule is really: if it is something that we think people
> should see to actually understand the example, then we should show it.
> 
> And if it is something that would confuse them more than help, or that
> generally should not be used in real code (like the fake bindings),
> then we should hide it.

Understood, thanks!

Then I don't think that the imports in this example are important so
please add:

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

