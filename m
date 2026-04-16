Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5833D6FC
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323302; cv=none; b=gMKgAtYhTQqEACI1GjnC+Js+5L2b9aE5voJx1EaL9CWr+p3Cfw5P+6oqpLeArj6YJeEOcSpxc+X2vKK1yllub1HvRRJJ8dwdIMhvZKW/wu3uTszKyOZKD5198KsC3rPR7TORwScdIORtSkuG75KywcAw7h5pYY7S8kodMHUI8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323302; c=relaxed/simple;
	bh=28/fZRbuAyUZVXYQ52AQH33d2fza7Pic6P+nIAQ7J0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XGP1LtkLqH8SRCt/D82v9BrlEPh1a61oZWxPtrInV+Ae3fM825+f6aQlYlo9ed6N0ac+f5kpvsEGeri2GT/JikkxCrMvj/yvIq7RJANsW8IWCUIhbzYggVnLKfOIsJD0EzEngLRnZcrscd/bGxI0m8uOfkkodvgyTQanV/xDEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vsCB2WOK; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vsCB2WOK"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-66e2f867f97so8833391a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323299; x=1776928099; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
        b=vsCB2WOKHjNZoN2NMqHKtudQXfvqdxlc6noBhHneESCtDPJzIGWceQw5vFYnDuh5NZ
         0FVXQ7t5gMZiWqF4NDwU3UQTEMe/wTuXpQZWooAiKZq+Wcn83PkBRU1gOE0l9OsQFLV6
         AY2cBPLDaNN42jf2w0LTt5IR82Ejc/D2456sonpsJWRPJEn4V4m/bPH45RgYmBuOs6Rd
         fKnAQHVkhTIW5++F/hzAUz7QqGKgAatBJztndlgJMmsRbCAwkWjFuJqUL3O+9Zc3yvEi
         BY+oj6tRNEGpmrGFmHNhRgM2j5HlYKgojrG3ZfvlLNKAv5dA4QZMFfVHlWTXAyK18oL/
         8HxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323299; x=1776928099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
        b=TdJdrgvWefMFx3yLbMn0rXPB6bSkzF5faLDESbOyAj/xO9W2XfPU0a9mks8V6gc7wJ
         UidBq0gqJvfRi3fq+CJKfflh7KeyS9Al0Yw3Rf/fmJcG8TZManfU9ww1q5espgQikSBr
         pTH6yJh2/BmXCACeAjaoLkk9VEgX86Ea9xmtO8MFFP/F+WJ6sGEO/4IAJReewKjN4DnB
         o0370URzYusVlagLjpw0Q7myoMxNvuEK7zXAZfqEIDI8w/r0yI+SQqp3N0s2oC4em6IH
         0mGkq1PxvdRmpR8/+jYd5oeV27aONE79iP+rSoRPVMVClQG/QkXmd9e/qsCsu26tXmJc
         wItw==
X-Forwarded-Encrypted: i=1; AFNElJ8XA/AhIIUPvP5eHo61A7TlbHdcLzgc6nxyAib/5M1JFRNgu9AmitWh6ecTCc4cSGohUXPEuMaCd2hFICQ5VA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lVs0ZcG674jO+TObnJjsuXLnHt/T68hoz3eLc4BbWcEqZG/r
	zstXXvow6VwGJ2jyAwttLScQ9PKHPsvQLausUYDYfrpL48h7AqJLvVW/O5WesEaiXth335mHlgu
	YsuFKSX//PDWW5NUWqQ==
X-Received: from ejdcm6.prod.google.com ([2002:a17:906:f586:b0:b9c:5eae:2e29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:86a2:b0:b98:7e20:b25 with SMTP id a640c23a62f3a-b9d724c8f5cmr1366009766b.20.1776323298770;
 Thu, 16 Apr 2026 00:08:18 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:08:17 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-3-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-3-450723cb3727@garyguo.net>
Message-ID: <aeCK4cLHsM7jbWEl@google.com>
Subject: Re: [PATCH 3/5] gpu: nova-core: convert to keyworded projection syntax
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 08:57:14PM +0100, Gary Guo wrote:
> Use "build" to denote that the index bounds checking here is performed at
> build time.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

