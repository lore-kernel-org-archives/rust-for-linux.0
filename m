Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D92CA6
	for <rust-for-linux@vger.kernel.org>; Fri,  9 May 2025 04:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746764196; cv=none; b=oCHjaG6ywrKGUjHatvUZSd6gtSRmqSMtkKBZ9pVH6a38DDG//gxV4kj8dbVGdLQtAp0JsMT8AEZhEcqsVOzjc5umHkGG10uawBG+ZCIJKkHUcs/4X3KInL30AJ7nZib0AdM7Wtad8GCXbGiiM01DbPsDSIaeJhgjQdzPoHlWKfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746764196; c=relaxed/simple;
	bh=Q8f3bgs76lp7wgDwHsGTV4krkSgeq2zvMhb9lXsSH3Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jbQX0VaiZI6+rsZZtwG4gLsxXpQh1R0v8xTXDMny3UKzL/IRYKN84d/TmKVVWePbPRcXY/qCE6oQfTNvjS90zon7cN+vGm8AR2Y6+UES8jnIx9jwuHLJuS1gVFQEcll1LnpYvjsNpenMokIM7amDJchNY6GcGujaVgsIoH79QgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqjQhrPR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqjQhrPR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22fb7659866so13834255ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 May 2025 21:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746764194; x=1747368994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwKy8RBe/AH+WVz44SYvt2LEK/lgzGxVqti0DC3d6SI=;
        b=gqjQhrPRfETrezXrBj1rIHfKc8bCtbtZBQe1j49vuTDn8JNSm/3QujDwhVFNmFKaaY
         S0lOiRRRk6+FEgaBlxtMPyS6i7Px8qUN3LoI2q32wPmfeaENFbGE9tGdBjH/qqsQfWY2
         7pBUfXL42w/wZOUSs7SeFJ/bA+MzG1fJ4eWMxrgkeC9yDPGUOgEPEliWJU8/JAyYsvvw
         IvASEv/c8MxWGrTeyYn9tJnXFO3k1jejeKExjeAAjh1RLQQAXXTE9QqS1EAkNFxejCYQ
         eCp4ZiSgYRPXaQ7WNgqRU5osOzSHii+9dJrZ2Koy5evVmg7f16muVVOTgJSXsRtKEaW+
         AJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746764194; x=1747368994;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HwKy8RBe/AH+WVz44SYvt2LEK/lgzGxVqti0DC3d6SI=;
        b=oshCMuOxQbp4XtbFyHmHuRmpoYSWXpjhsaMergmiSI2Qw2IYfJhdttO3BvxmX6sLJ2
         njgHNrYNtXWzwGCaQVb56UG+AbCHgjT/7lkxbfWqYhkNgVEhi/60jH3g6ITHg1CCZY3q
         j7gXlXHbqLAPVEKYnMQ4sSs6PwAhL8Z11j79yAILZ8e7FEvvVnJcUuPrzuLTdm/BGwav
         aTCWH3VUt6xJb5ZWJpvkwPy28oIsjfL+fZ4AhLWUGhCYWnFXzGbh5cUnLvgqL1jRrA0Q
         /5UChgXbYva4NeEsy6wU30t6fEbprDTNAxh5+SYHKrlM+2qAl3uRzMin4OFqcdoZ1ZOM
         5GEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN+H9YyDLwjC2yk4RsORqx/uj1KdNdLGnt7Y3X52C+GbPm0aVik9wFhSwtL8+6pQENWA+lC9m6OH/LcQk5Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDnAarcKNTmky7SQ5FSoNCvBQXbsqfnucRkg7WYd/8M8+7Z8X
	sl1BGYdudr/UnrRNPEo6cZTfpUk36Je4fp/GVtzNh2mtaZ3x4SYo
X-Gm-Gg: ASbGncvWiphOqwKiYRcd3XcMtRjZtGkwSEpfUtrWzN6bt446ebRFPeOOojqvC9e6XXv
	05AFmN7c0igs5tnPcZb0mTpqJizk8I/XfqZIpeCvBrxL+YrnUTNtyVD17cgycHUTmtmGrExvyYi
	EY6ugfXBy1eQeqi2J0jDC/yldAwZETu/VfMWkWRFJRa6aW5j8/jfqDbIYiN0K3UHmVlkwL6FOJO
	B143yyHYzYaS8xiPLaJ7Ku/Pctx1Bsi7LGD56JVsiocbFqYYjYBm0Fy40fSGbr35et+XvegLd+W
	zRwVi1tNp0PyPkJeA5UpQDsmyeTL7aQmxx+I1FIyv5BJJYyZT+Zx9JQu97TI7+mAyJ+e/kZ4taY
	R/TlXTKnMwWhEP0+2ICZmqLM=
X-Google-Smtp-Source: AGHT+IEXoVxl9bJTW1VNHg036w6afnGMkTC8/kLw0y6WVVb2MffrICBW79BGcugEj6+2rj4IFxthAg==
X-Received: by 2002:a17:902:da2d:b0:224:1acc:14db with SMTP id d9443c01a7336-22fc8c90a7cmr25837695ad.29.1746764194467;
        Thu, 08 May 2025 21:16:34 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75494ddsm8202925ad.25.2025.05.08.21.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 21:16:34 -0700 (PDT)
Date: Fri, 09 May 2025 13:16:22 +0900 (JST)
Message-Id: <20250509.131622.164788613577030480.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 rust-for-linux@vger.kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: module: place cleanup_module() in .exit.text
 section
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=LEma8DEgpy-z6hCK_xv2Vk91MLbGGC5=votDAVP-3mg@mail.gmail.com>
References: <20250308044506.14458-1-fujita.tomonori@gmail.com>
	<CANiq72=LEma8DEgpy-z6hCK_xv2Vk91MLbGGC5=votDAVP-3mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 24 Mar 2025 20:18:13 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> Place cleanup_module() in .exit.text section. Currently,
>> cleanup_module() is likely placed in the .text section. It's
>> inconsistent with the layout of C modules, where cleanup_module() is
>> placed in .exit.text.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> I think this is OK -- it is only under `MODULE`, and `__exit` is OK to
> place in other functions (`module_cleanup` gets it by copy).
> 
> To be extra careful, I will pick it early in the next cycle, unless
> someone sees something wrong with it.

Do I need to update the commit message and submit a v2 of this patch?
