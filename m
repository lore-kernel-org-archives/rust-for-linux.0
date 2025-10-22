Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A7338921
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761132492; cv=none; b=Jp54SoobpeT5f8WKmqXk5MYO23NY3Y8DWoTSlWTjtK6A3BrUCuxW3Y1hkqfCHA4bRVpF+6qwALgVnOGz47YzFQBb1dfArcHTtm8GzVI3+O5bCstgNuGwHKkTV9RPFFNDfG96X7kHgnH0G9LNQq5d2PPDhPUNJ/kOqvvAc4V/DgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761132492; c=relaxed/simple;
	bh=GeYp5ENRNtZGT10yPqhZlLkA5ANkd2KNx9IryLw5koY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=k4y74pYGLiSJIvvXy0F3cClxpxleZjMTj0kxdfeQM0WpZup2DlBjBJsNvYC3DCkp7LNQOqkjQ9TZq8xX8a9TAXgYlbYQif01nJimJC9bv/LTy207gckKQQiUhQ/nkvzlU0FCZ/wqmukdrqwaE7bMlECYDNUlXPi58qJkwIZABaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq4Vbwk9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq4Vbwk9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290cd62acc3so63692155ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761132490; x=1761737290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqxPU3ybT0jcPtSpvtuctUbg2p7l0ybpoGGX4OXazrw=;
        b=Aq4Vbwk9QcMPBwjRSfJ8fYXQwlFKWqKPBgHX+1pgX316vONZTB2U1oVm1owf7xvMwJ
         rZ6ivxyMCC2ZFVG0QwHh+KkrYva1+zrR+gJdDY4n42TNqIcUlhV8dXxifBk2B+PEznpM
         TcB7LXZNONQQCT1URzBH7Kgs9Kf38Ui7KKdk4MWaBf5IOz/E0R4qopDZEMpP+P4ekaTD
         IY50LpsySBPp1JhAiWyvcP598uKZMQ7RYWGXQuIKZT9DWfLLhjt7gZjRLshYMu1YaZCe
         8HAsy+B3fA8QXint2qjcSG0h2TmpD9SqFcXqoLw/bxKv72E77MgWBSDHrGOpRXqbrbpR
         hs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761132490; x=1761737290;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqxPU3ybT0jcPtSpvtuctUbg2p7l0ybpoGGX4OXazrw=;
        b=NPuHtXznkjANl+UCeOsMA7C44LcVmpYP382gHOo/CGOEhyj1Kya2cHc7/D6a4drFxG
         bUNp2xaEjEzyKkB69v7EI++raQa5dA3w/Q0xl2Mrj7Q/PVLvICRBfyvsqc2xSR2sdK8x
         YvAd6ILVCsYytDT9Qq0crB30NnyqPbRivdwbDK4nykW9rp2AQXLunPGAZUokBOfjgDbh
         uFK01srYPI4ybEQtitUd7Xebed6aCLbjYIigY+ZUlB9SBfqcV0aUQlQCogmD0M969yJE
         PADVk12o2UCldVKYdAGRqpIMGFYHCi7Cx2RSqIAspJg+6ZEbj/pY3isGMGxsjdMPYcWW
         vcKA==
X-Forwarded-Encrypted: i=1; AJvYcCW/4cxX+cpeAnytBcgGl3IL582jJheN9yUTpLWLb45OgiSJx+rF6oNBN+mYaM0dPWDjvzHQeTQ3U6r6nKvgcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrkCr9PewvZDIW0KmESNBcNboCAUX7UB61JnxTIL/nm5+JesO
	GZowRVUnDTaMi+n2IC9Q2GQI+QGsasjPpSDOSzcf6EoLEPvWxVENMs/H
X-Gm-Gg: ASbGnctFncejY2v659a9oqKqsWFDc/FOXhJke4uGn0UsSQh60oHrD8IkhjI+U5bXUQg
	9EAdIm8pbj0tTbIG3D2zJyMdC1vbDval+e9N/o44cH5McTnt7KvNsYo26szfOfHQ3Bj9VgOHYIm
	mhLR95cM9Ws79TQQwfKem0AA0DsSFj7oVfKYKp9ri/NGkTyz4tg9d2C++0sgaBPXMikjRjFZ0Nw
	4EdGDwhsvMScZUV48hzNJslfJrCIWyTbRaniC/TgRWn2KcUdSgAoxoBf6mJG96CUQzBBcjLDEXy
	Z0NcNF45EXUmQXu6R8viTBPhjskxM3XAmvdik2oYfKr2l+TCu9QZDtlDrduErW9Tp0UJdIgtKoc
	oSM1oo1gOKpHwFi+ifAXr6sOTDFTN2NpdzPDd5cBEJ35ITMjHn3XqEk9pHtri74lbNNL7acttln
	LCQVe8Gk3WtR5D97owOAJSxM6+VB4C/7FZqRgE2dVnNmBGgk47rut9Wq3Jx50AJG4S
X-Google-Smtp-Source: AGHT+IHGaMtzm0oPfRLcVei5D22QVh6bUWN9a4cAiOtccRcsTBGutGIH9BwZOenuaOtlvKNrgysN9A==
X-Received: by 2002:a17:903:138a:b0:290:26fb:2b91 with SMTP id d9443c01a7336-290c9bef53cmr248187565ad.0.1761132490409;
        Wed, 22 Oct 2025 04:28:10 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29247219357sm135633135ad.111.2025.10.22.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:28:10 -0700 (PDT)
Date: Wed, 22 Oct 2025 20:27:54 +0900 (JST)
Message-Id: <20251022.202754.1583747778621840789.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: aliceryhl@google.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v2 2/2] rust: Add read_poll_count_atomic function
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <a5cca6ca-9147-4531-81d8-05af1333848b@kernel.org>
References: <DDO06754OMN5.G0AN9OCWTFLW@kernel.org>
	<aPeTFMeVoIuo8Lur@google.com>
	<a5cca6ca-9147-4531-81d8-05af1333848b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 18:02:39 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On 10/21/25 4:05 PM, Alice Ryhl wrote:
>> On Tue, Oct 21, 2025 at 02:35:34PM +0200, Danilo Krummrich wrote:
>>> Please replace the match statement with map().
>>>
>>> 	read_poll_count_atomic(
>>> 	    ...
>>> 	)
>>> 	.map(|_| ())
>>>
>> 
>> IMO, this should instead be:
>> 
>> 	read_poll_count_atomic(
>> 	    ...
>> 	)?
>> 	Ok(())
> 
> I think map() has the advantage that it is a bit more explicit about the fact
> that the return value is discarded intentionally.
> 
> But I'm fine with either version.

Then I'll go with 'Ok'.

I'll send to a different patch to update read_poll_wait's example for
the same change.
