Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB7374E62
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Apr 2026 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844435; cv=none; b=t/7W0DmOjii4t6G4CSYurf0ewzBlww9gNN1c0XapnpFFNbaij9ieQi/HadO1u+9gw2Ht0pdyRUSIB/uQ91gv9QEaOytMgC26pGrrTcwJTzQ30nkuYpbnuRLFF9SSLnv6aaNEuU6ItgPtOLH68TMbvrjiegk0xLw0/Cd7KPLS41A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844435; c=relaxed/simple;
	bh=P2PKsk7fNzG2H46h9chWVfwFOLLLAa7loCQ0KXUVcmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVm36Sz7Domef+np2Va5RAfUknRnLjqeVd8ioTAp8mppCeXZZ2uspVYUUonO1Gf0KK4jPeN8ptBKK0BxA8If0lwPwEZEkeDMMkwqBDxspjf0ztHkrEZ1S7X6fn2Yh6snw3fCSKlZ+6mL5VFqXZOA3ae670DLyD43BwSKKiOsTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hni5fVwA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hni5fVwA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f8b60e485so2150886b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Apr 2026 00:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776844433; x=1777449233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CjbD5DAtK575buPNI+qG/w2afm0sso4VcbZ59zXJsdU=;
        b=Hni5fVwAIQFEIp8AmdOyw8ca3JJ2ACtfq1iPXviCFGfbRDeXc61WKMh6vIkFad3lOJ
         lEtznHGFRbBomLby0w0kJ8RgunZrFqWFYbjmX/K0kFY1csuHaH4wT34IUn8L0YVwmN3o
         Z3j2OcPizfv8pGFxgQrAY+prXvarmW9wUouXKBYcXa6xQ6FQqOlmNB30kMeyhouJ+9i7
         k6CdPtu/f276JQ/BN8/jh8df87p42ibaINYqmWTTqB4vGjBBCh9rNrM3lm7hm4WSQcbv
         R29uLUmM4HSCzOBcyy2R4HyEnPsKDmzDxFVEJFrz5Tw296S6wp64W0LXoB4540bzJZnj
         2+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776844433; x=1777449233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjbD5DAtK575buPNI+qG/w2afm0sso4VcbZ59zXJsdU=;
        b=Skn2654lmu/vx5dC1RhOuXy4AqqJwvvzC4fO58670+CyTx0btz2qRWxww+8gotAiXx
         GHqs5PpCV0gxpn4GucEyzbkJ/3EPmgaSmn6dkGXKvTh/mzhR8+uTbQ5aqK2S9RLJXIgE
         N+sF5IrN9K7j52CTsVGTw94f39/Evi95kSQMhuADicQwdLvSXXV0QRsfqhUlEUVSqpda
         oN4K3y8MBem7BLEv+pDqIpZ3wlDGUlyZbtOZSjLH4WnIb3IRYeqk8/XKz/Lr4PgNwMnx
         09CF4crizkn1G270XZzpmamUWqE2t2I5u68DhZ2M3d2jDQ7/WAjh0u9ZEaSoqBwYh6RM
         ApAA==
X-Forwarded-Encrypted: i=1; AFNElJ8oX+YhMBheLBkXUCojn88XQTVKG4+w5TtjhAULxvU9xgA/czTTxQ8vxCi5MGuWH99DimWh6zefx0htt0KHZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu2gkUXgTCqZCVxi0UguTLJOHdPuGfzPK0kUIvwcHWCx8Eptw6
	CxfwYVk6LbbrI4kkPP8vq04BmIDfjrSTfGA3bG1g0RLaFxkMjLNrJDo6
X-Gm-Gg: AeBDiespk+zquDWbO4lX25fnY3SRAcULTqBIm8LR1AOrhpwYxznPaSHy4RUA18CFCmN
	viqvq9VIR1amFfFwQOlqy0UNQR6a2Ct4BCKA5abpYZhAudLCfhDacFkerDHlURHIDFiyxpwGrh1
	JOYKZ/xVSEqV0+SU46JAuO0OhFcfxWj5j8/41gPpLteAMWknmozK0drSRja5A0dldVSMMbaeLan
	R4GXzHrGeJsaZeh+uqzsKrkW0llP4L1Ta3tvDrr8GqcI+pidM3AFEboJi7qwiEjJ8hPsEo6O7Or
	h209LvlgMkSIWiRnK0zSFGxHDe9+32uNc2pVuRLzxVuf9EIsHec5Hu+4GM0GTBHeNs+IGmpAeOS
	RnNKuGw83pj/K8IQjMq6sNh2vxeekmqhk64+cmMpdXpCU8qX2clXDKxOClTEYcmbtqGfBJtlzHj
	bLD9m6tcM274aDVP1f6H2vGGwIhtpp13jhzbGh/XSdZj/MngOCSkxPtqSJuu03F2ceEJIBxVMwn
	BW8mA==
X-Received: by 2002:a05:6a00:3315:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-82f8c99bb55mr21216994b3a.38.1776844433042;
        Wed, 22 Apr 2026 00:53:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm17662514b3a.14.2026.04.22.00.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:53:52 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:23:41 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeh-QhEGO7ZiwQZ7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>
 <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>

On Tue, Apr 21, 2026 at 08:16:06PM +0200, Miguel Ojeda wrote:
> On Tue, Apr 21, 2026 at 7:47 PM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > There are some other build errors apart from this on 1.85. So few months
> > back in the meeting with LLVM team we concluded that for sometime
> > powerpc will be ahead of other archs at 1.95 till others catch up.
> 
> In that case you may want to modify `scripts/min-tool-version.sh` in
> this series too.
> 
> I hope that helps!
> 
Yeah this helps, Thanks :) 

Will post out a new series soon.

Regards,
Mukesh
> Cheers,
> Miguel
