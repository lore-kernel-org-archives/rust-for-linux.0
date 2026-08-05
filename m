Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857BA37F30C
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939708; cv=pass; b=B7/JpVzaHhr4T5ADkJuLnBCieOvU+Ku36RYB/i7TfMJ5mv++sJT6oOXhBmtaIW5QctF/ludaWJJYfm+M4kUbz/J3Gz4yRYq7ArPV2DaBkvG4mru4x+slwZJNxNiat+6ehItiVHunvKIuL7a3yX4ewmgSg0vpO0G32bl8LOJW5BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939708; c=relaxed/simple;
	bh=t9KKJs8gOzuq4RuyUZvo3auMMuF8q8NzDX5FBo3XykA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL45TYTviQOXElFeRWMdG/61b4EeWrzqfb9eb7O3h+dbIF7rfYyjAEdVxAAOZkIffmNd1PilbDqYG+AHIMy1NOLpkmN7mUqzb04K/+HZzgB1uTYHQatCc7plvHenbP3b481mbKayQFdb/pbtetchCBXfU/lt+o/bK+069k2DUYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gl+LFEff; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl+LFEff"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43ce24c4978so55161fac.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 07:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785939698; cv=none;
        d=google.com; s=arc-20260327;
        b=NBrgrS6AtqAZc/Uzsgdh3/wBUhGaVt6ZompQFyB+qTFNCv80FAV1/YpA6rW6m01vQw
         je+4uoJc0dNK1Jt7/uJT8bAnsCyBUhua1xuKGQe8G3n7C1LZzK0ItGeiKvo0pTwZ6JOT
         hMTKrYpGYBVVq8ika/IgVEoOMYlMLD0aGXTE1Xg03N0z3Qyma/KrekEnqH5KMR6L/rD2
         Ekhvub2VsRtIbKTOauOk3bJ3TKUYuGfcQl9xI9GpKg+OdjuRPY0quuz3RIREk7BPZHCx
         FPOTSlA4ohB1gCU5mjNgQ0tyKDiY6tOeZdAJ26jNwW2OeHyupYa/gcmJ1o4YYO3QJ4er
         ELxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9KKJs8gOzuq4RuyUZvo3auMMuF8q8NzDX5FBo3XykA=;
        fh=HNB/SKRVU9EGuVE7bqiQac8ZEYTnroF1dp6yoUfF4W8=;
        b=XzcOVZrg/pAQUSoiK2LwPW+ZLfBn/0Z3MTgQ9g0DfeJMGPcENo89M3ryVRfmIJa0wg
         YKYUL+Rjx1dAG3+88VqsW54UxHd/rz7z52TR74enVROqUOqpe6O20K6e8peClodN+epu
         Sp7LaD9/R/G32vDmhU1XpcBWM8OkV0jFITfv4bONgNJXTlxCZ/XpgzlFQSNMGBaRoyvd
         kv1TT7zCcpkLZmlGByqGre7HhZfcd8qQlpH3oNH+NP2HgkpmQKFyfRhhaTaeoF8tAkGy
         z/V+yUI2PBWlzX70SQS9zr3cBo8XOCmKnKHGwAw123lQCUbD7CZ7RYZ8uihIntWLXB+k
         YlBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785939698; x=1786544498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9KKJs8gOzuq4RuyUZvo3auMMuF8q8NzDX5FBo3XykA=;
        b=Gl+LFEffJJR6xKlDhBUmIidXL+3AMNwzsOqifqBHxUMh11yKyqAUFQkl0qOStecd9o
         w0dgAh004lDmkIfkZEPDRSOtotW3vKW7M2MmE8xfQi4dm1OampwxAr9RKALeXakEupLI
         ZIGm75IfK2KjlUty/iXI/aTKfoiWnYI+yb8xNGuq1Ch3YMCoQ1yWWKtigt895TYNxQt/
         PPX6HIi934nwXfF6n4Ksrtus5I9f7f8qUjNbyAf0FNreDSfTszLbEf3QtrB6FR3Z6UwL
         nTsi7bSiqs2aHqPv2YYk+VHBkICOfVPCdlq+Hf+9Wa6adObnYeAP6T59qfjMGBU++3Y3
         WtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939698; x=1786544498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9KKJs8gOzuq4RuyUZvo3auMMuF8q8NzDX5FBo3XykA=;
        b=X9swC/vs2VgK7MJptSNRNNEUd3aIzx+zUpcaQvXDbZmizd4YAMcZqJPdUfcgUAUxmQ
         T73zrLTvcQkeR5wEmAuR5l/fkmAwKhAMqGdFOTLVLAFtiMUY4zu03//SUwyh9uCcRhj6
         gt1kHupi/uvgLq+FBACoFXId6HhaKQEQNXWMimeZ7mxUcPpaZNkdTvs+9liFfyZ283Nu
         aBQ35WuZvPMpnxJ3ogpMhX32wlnSSk8/Um5+xqWM1m5a+PT0ANhmVOiy/VzzBh/FzIBw
         BVQaA8LGzqpFvZ0UVgsOtDSHUQFqH577ySlcp3+/raH8HtkIez0DFUCn3mJ/WANJBWXb
         8kEw==
X-Forwarded-Encrypted: i=1; AHgh+Rqp9AQDyqIpkbLfxbPdC5ObrNW5nCO0b/12x9PH9pcIK3JPPVLx7CJJAhTLC+LapvO1zWF6o2TkbaJ1hcXW/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLYgMf7INrjctSxhamqsKlWBvgu0OAMO8d2Wa3YNxP8DHIKCH
	k7XS8KSS8OVuyq60df8tGfPUy5IVERtUuEOnuHEf+nKDxybYGISoNLGapsbw7PHUaj+hF8eKGJU
	S3rYaADCCFU4KNiOXjeQiXhHSCzH0aaA=
X-Gm-Gg: AR+sD10m5idjVLwo+dW4uIQ+F/hpWeq4wcwwGptYvzn97bsOyYxjc/SqADG0zEKvqHv
	2fko0+78w6PrEkGssQBFj9UHVyQxwZh5sukdqBefbSzbh4QEZDuCxeGKq9QU4k0XKcMQSSrP25I
	c0cZyOJq1SodlLPwNO/1rjs5/9siMNnB/geA9MxgSQddPN2l7VMBMCORV7IHuPHfqXvxpp9bDMi
	h225jiKDq7jrhQ/OkBjVF2hNjKRv0fRBxNPEIl37R7wPoMxZzaLp/pj9Fc2XKoz3JV/7a8qDR2/
	41dYS/jZhy/CdAUHvr88iUurK+Gqh9PDVdu3nuLY7tI0245fL4rbjOGVhEVTEr2TTgsC/OLTOjy
	24EbQ8NnTVnPL7YXznCahjDMFYYXw1olfTr+1k3q6AXxa3LHjtRftV/cZqE7B
X-Received: by 2002:a05:6870:21ea:b0:447:4cf0:eb19 with SMTP id
 586e51a60fabf-4599eecd55bmr2013818fac.4.1785939698138; Wed, 05 Aug 2026
 07:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722214951.72941-1-tomo@flapping.org> <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
 <FenzX1BbXwDwhxl2RJ8sf7OnFwsAi3prmxcHhYKtfyXwJ_l88xtj5rr-z8T90Dqj1Em0RGPwvxQNqlo0pl2e8A==@protonmail.internalid>
 <20260731.224825.536098581345512332.tomo@flapping.org> <87v79o7myg.fsf@t14s.mail-host-address-is-not-set>
 <DKH2NGL7W29L.2K5MVFFHP84JX@garyguo.net>
In-Reply-To: <DKH2NGL7W29L.2K5MVFFHP84JX@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 16:21:23 +0200
X-Gm-Features: AUfX_mzd-J2vx9Ey014cLy8VRibY-eC17UFAN9PyxIH4MmeEpmHRJgz-3aChkpY
Message-ID: <CANiq72m5ZWTAs8XXfPYkEfDj9CT4_N7ZShXSj33WqcWwNV=NWA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com, 
	arve@android.com, boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 4:15=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Ideally we can still take them this cycle so we can add users in the next=
 one.
> I suppose otherwise we might want a topic branch early next cycle.
>
> I think if you can pick timekeeping patches today or tomorrow then they'l=
l still
> have a round or two in linux-next before rc7. Or perhaps Miguel can pick =
these
> instead?

If it is late for timekeeping, then yeah, I am happy to help.

Cheers,
Miguel
