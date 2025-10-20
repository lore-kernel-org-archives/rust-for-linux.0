Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3C23EA86
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954488; cv=none; b=bgthvEps0lIrzRSvlxfiCxkoerjhYTONkQKVe+MfdTeEaO4sqd1PF/crhuaoPtS/h58C6LixRrUb7y17K7wQTpEcfPg98FqEONuQvuYDZ+uGcVrHWRa9W5cFmxWXGZkubTcF/44+sZFqPv1EAHEL7HcKsBALLZ/RaU66KShL6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954488; c=relaxed/simple;
	bh=mhITn3HDo0uQ823iD054gcNgABztLTs2sqLqGtvUuxE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qK9MsYXfqs4+vVeJQQJyjfpYqTK4oBvozsz97s05+i49vfnGKqTVJEhpMaxNSlQujhj+BzMmGjYkVtUM2AYC92eRf116p8Ye8BS1p9ZRVmpX2MtXh+w3mbcT6jxYEHxysx447MO13R+jtNPVSTyvEFy6Rt2YWE0bwA7+c8/GQ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DI7m1xyh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DI7m1xyh"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47106720618so24366835e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760954485; x=1761559285; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0l1K7JIIcbBvkAiIx/D88CHUVKA5vo6fkTzO0AUaHY=;
        b=DI7m1xyhb1cJqgJQYHoz4KCfk9x21tB/H9AjSRDJWLldf/LEiZ6EJcCS9Fr/YqKchS
         tXy3Cv8KinM/Echpsq4GlvupQ1sf7jvkG4evdZVYs84SMy4QeKnm6ZhM5ncJeTiO/Vmj
         Usm2Y2UeQn8F0p0JdSJ2YoxR2BWUEmlvIb8yA0CaZOt59e9Vpj22rtqfsb0ZYyyY9HOd
         uGZ5W5e9cD4suAcGvAACa9Bp2I/KIrx2MPfKUSpVuVhVQ2pz2waC7sHXtNnfrMb3ivw6
         LS4z0tmmNC0tyk3KpUj0D0XeJCdquRTyQd9jBIGGwkageH9uOTFvQy03XGy5SnmzHELI
         F9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954485; x=1761559285;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0l1K7JIIcbBvkAiIx/D88CHUVKA5vo6fkTzO0AUaHY=;
        b=sKCbgam0yeKUiwGstivWOEiHqdoZEl8/7v1D6/qGxSEpA/KnV4Zn7b744m+OhO6DO9
         xsVHxK1s6zSNKav7MC8PFD/oDI8j8TKUUAZ2YX5xlb04cLWYyq5WskRInRXkR7ylviKx
         YXBdRanJGaKCsuMdU8cjBostDuOZkTMXu9I1+EgiHjJ/RmZu4Jz/txoouu0Nw1A2buS5
         J+uhmWloY+dZntlVJlukgJvh5BKqYVHs+TBm9Wd7XgVMpbT9r2+ESQZczhj9F7tN3CgW
         aqX1xVEdcb+x6F92mL2mvSIBOFBzMmxYyTMD/JeaX54rfiK79V0PWX88SGdDE4v1nMV5
         yrzw==
X-Forwarded-Encrypted: i=1; AJvYcCXR7nf2TmtsFsnAcjUktZADAXDUle0jrpSI+W9hSGly790nTw58pIZ7/nUT9q8CWbTStZiOfWOUU7ujNSJLrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1el/VF3WGvX5hETI66eGzyWxPFln/PMLqfvD41YK/K3gs25ZV
	odhrjMjUCJFIUmRr/ClX3xFTQBotQdq73ArjzqnBNbsOa+VqjZ7U4H0AicAyoawjLmb6V3z7zTC
	inaVEn5TpVwSHthRiPQ==
X-Google-Smtp-Source: AGHT+IFATPYHlVFBmlLsBVvlR3qG2Rbu19LkskrwZ1g9wMvquqf+maELC/ipWw6CiyqUDRaelkkGsv2zR0WAluY=
X-Received: from wmbd1.prod.google.com ([2002:a05:600c:58c1:b0:45d:eb3b:5482])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548c:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-471177bad0dmr87865495e9.0.1760954485032;
 Mon, 20 Oct 2025 03:01:25 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:01:24 +0000
In-Reply-To: <20251003222729.322059-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-6-dakr@kernel.org>
Message-ID: <aPYIdIk7jXruPeV0@google.com>
Subject: Re: [PATCH 5/7] samples: rust: debugfs: add example for blobs
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Oct 04, 2025 at 12:26:42AM +0200, Danilo Krummrich wrote:
> Extend the Rust debugfs sample to demonstrate usage of binary file
> support. The example now shows how to expose both fixed-size arrays
> and dynamically sized vectors as binary blobs in debugfs.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
