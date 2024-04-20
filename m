Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610EC8BEE
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Apr 2024 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713575674; cv=none; b=GazOxMrgGaCx4nF/jYTtf+n9YDXBqhGUxPRqOa7Id836mwslJUiqxrkkH874CADHd5zyR759uWqJXb78MjJ4HSDUm+5qbMwl5EMItYhOpVZZOk7S8AhDsxl/e8Fkf/RozgMjAr29Y5eJ57OCA5Jj21apW9cP+KGuvaD7OtTL++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713575674; c=relaxed/simple;
	bh=HHew0I5F5jRFe2w/lRVUND1JlBCx15dYK3TIwwFEs1E=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NvLeYRRMMSc0AHR+869VohfNWyHiJT1pifqbIEht7a4Q62JFs5Ay4531QHcuLW3o83LAhoN79jC9m0sVQh2peQoPDv5pR0paEj9ROnhaxHC9udhvTnxaKfZ2YqC+BKr5YvEXNQAaJwic3NZB5vKqEcF0+QUH/BoTLtI6cgeWqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP2dlzhG; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP2dlzhG"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7d67d1073easo19175339f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 18:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713575672; x=1714180472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8NnoaB3Tu+UzSU3xeEFgtSobbhOZBTGXyzMA0SXm5w=;
        b=cP2dlzhG8y7Tk8yGOtik/mj1VxPzu4YZKJChRTmQELEMH/pCMIPz6iv8ZhoRcyeDKM
         VOPcgfzZiP5T5HFj1RzBkSolPohShLMFuMIn05isMu7aub+CaTtfYtBpRu3OSb4QTwDJ
         M9Y58Av6PIkP9xAuMdB98QGXtuAs2gPYsQQTkLs9ylXdBRUNtYtB68lws98TTEpd6PxX
         OjZEYFGwFJS5XDdmBOOomZzxJtl59NMiGO/I8oK3YBRvx60dQeenZmt7rHYYqyJoAL24
         E6c3W2Yb4RJu05aGqKuBlOUuuqT5vBm6hiDEJ1zlkvR5bm5Z6Bn/MidmLx1chYGQAKWd
         iOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713575672; x=1714180472;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J8NnoaB3Tu+UzSU3xeEFgtSobbhOZBTGXyzMA0SXm5w=;
        b=BKkHJAQggcKfrUUkQNf1JnolJSG234Sp3wP1aLbXXlA+AYgGdVGTQqW4WM3/nLqYw4
         qH8vjusv7Ny8iX3hKgs9Kcmzr5W21yGNI1StPMBCGtBM/G44Qio4OhARAV+jSDKVEm9X
         jcUMczf9P3XMEb3JW5FVTiyEu6V/03pBwJr8fifRxnKaWA6KN4u0IbqffzhCa+6bLha8
         gU4I3HkRT83q/hyEAUcws2m4qxBvxHZr4dBhemFpNR7BJ71E63D7wzjmBuAV6v01wl9T
         G6EYwigmCiBWCfuUAxvbhuJas7jwJYMUgBO1bNgi8cXNbUe2E6QGIl7ZjlsLyTRfhW7a
         WGSw==
X-Forwarded-Encrypted: i=1; AJvYcCVJZIJF0U0l4puKsKK6+R/GJOBYYt2OYyfjUenIaUIV/knJHA4R64xKrXG1K3k8BdeaMtoWHtM0B9qFLLu1JQ67AbWIhBYaiDshhmkKN7Y=
X-Gm-Message-State: AOJu0YwYyh5aYohN+Ac2FUNGs8QL6Mt402Al7lvamCdrdjt956t9w/Sd
	dwisvc9vZZmECPEQX9zhFLvJ3hmviM511EfVXfS1+/L1sVmEajkD
X-Google-Smtp-Source: AGHT+IE60909L2neFmIwAAmO2Kh31d714wfqGg737yOB8p51jfEOi4B+ejjbJKH2NLCTmqbNS8SKtQ==
X-Received: by 2002:a05:6e02:2187:b0:36a:2d25:3d82 with SMTP id j7-20020a056e02218700b0036a2d253d82mr4810793ila.0.1713575672456;
        Fri, 19 Apr 2024 18:14:32 -0700 (PDT)
Received: from localhost (p5315239-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.87.239])
        by smtp.gmail.com with ESMTPSA id o6-20020a635d46000000b005f769b41a58sm3782065pgm.4.2024.04.19.18.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 18:14:32 -0700 (PDT)
Date: Sat, 20 Apr 2024 10:14:21 +0900 (JST)
Message-Id: <20240420.101421.329379978497339506.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module!
 macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me>
References: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com>
	<b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 19 Apr 2024 16:41:36 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> On 19.04.24 15:53, FUJITA Tomonori wrote:
>> Hi,
>> 
>> This patch is necessary for a new QT2025 PHY driver in Rust:
>> 
>> https://lwn.net/Articles/969888/
>> 
>> Are there places to be fixed or imporved before sending this in the v2
>> of the PHY driver patchset?
> 
> Please also update the documentation.
> 
> Also what exactly is expected as the parameter to the firmware field?

Oops, I overlooked the documentation in rust/macros/lib.rs


> What do the strings in the array mean? If there is documentation on the
> C side, please link to it or explain it again.

I can't find any on the C side. They are used when building
initrd. How about the following?


diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index f489f3157383..19175b3e7172 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -35,6 +35,7 @@
 ///     author: "Rust for Linux Contributors",
 ///     description: "My very own kernel module!",
 ///     license: "GPL",
+///     firmware: ["file0", "file1"],
 ///     params: {
 ///        my_i32: i32 {
 ///            default: 42,
@@ -74,6 +75,7 @@
 ///   - `description`: byte array of the description of the kernel module.
 ///   - `license`: byte array of the license of the kernel module (required).
 ///   - `alias`: byte array of alias name of the kernel module.
+///   - `firmware`: array of firmware names required by the kernel module.
 #[proc_macro]
 pub fn module(ts: TokenStream) -> TokenStream {
     module::module(ts)
