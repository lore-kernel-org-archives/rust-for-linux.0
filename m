Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B77216A00
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730999397; cv=none; b=Lw9XHc4XJvxGT9E2cU2FiZhCOcCx1cGbMvVRjKPA/KJSDV9li0UaoxxlhLr2qECvx4vwPkU8XTrPxj2/sRPdBBRfa8PYw/MI3koQ890tLMcHTBGY4Z/QZL8pOhOdAuy8WwIqbD9qTBLVz4RHF/bkz4vXX1q4jRncFvac3wNpSbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730999397; c=relaxed/simple;
	bh=Sc2kkmVag8JZmDQQOGAev4MWjffkUtOpARZ1iWbbcjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxLRPFygAt7SwNF8+X5/qxWIdkd7KOMYBxNzVorYh6QK/vPi6fb/hJ1ZLNejq7GOAO9pvczpKLz/GJ5lJ95G4V/CJKBFOzeH9aiLgZko9B5CQEEH+hvqtK7tytIzGo9zMvaOzW2ETQiuqaEemYF6uHymbBi+dR0xIKSm0fc/p8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IySs1wcO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IySs1wcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730999394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AA5XAlWwCizTNJ1aw2XWsbcfdnUBQq1EXYsuL1VNjM=;
	b=IySs1wcOB8/QvXjvqW7biTF0Yt6bTh2+QenOPNgUFajDmo9JfoaPTIgaX+oZCwLV0YwrEx
	S+LE/56EtJkcwRb7zvwI2xfjm7WiVzY0gwwl4u7vK2NTjg8XZA2MrWBmAcCu0LrHefi49C
	bxTJu24HQhtko17eTtLESncE9J/2m6o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-R5_5PKKvM_-8Jd4rn86yCw-1; Thu,
 07 Nov 2024 12:09:51 -0500
X-MC-Unique: R5_5PKKvM_-8Jd4rn86yCw-1
X-Mimecast-MFC-AGG-ID: R5_5PKKvM_-8Jd4rn86yCw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 429FA1955F10;
	Thu,  7 Nov 2024 17:09:47 +0000 (UTC)
Received: from f39 (unknown [10.39.192.153])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53B811953880;
	Thu,  7 Nov 2024 17:09:40 +0000 (UTC)
Date: Thu, 7 Nov 2024 18:09:37 +0100
From: Eder Zulian <ezulian@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tglx@linutronix.de,
	williams@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	jlelli@redhat.com, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
	bigeasy@linutronix.de, sfr@canb.auug.org.au, hpa@zytor.com
Subject: Re: [PATCH v3 0/1] rust: helpers: Avoid raw_spin_lock initialization
 for PREEMPT_RT
Message-ID: <Zyz0UWH--MHjTy8r@f39>
References: <20241107163223.2092690-1-ezulian@redhat.com>
 <CANiq72nmWeyXkV0fhKwQESm10OdVuS7UGAux2N3ic2B0zNhuuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nmWeyXkV0fhKwQESm10OdVuS7UGAux2N3ic2B0zNhuuQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Miguel,

On Thu, Nov 07, 2024 at 05:50:50PM +0100, Miguel Ojeda wrote:
> On Thu, Nov 7, 2024 at 5:33 PM Eder Zulian <ezulian@redhat.com> wrote:
> >
> > As a note, at the time of writing, RUST support for x86_64 depends on
> > !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300. Miguel Ojeda
> > pointed out that this can be avoided with Rust 1.83, to be released in 3
> > weeks (2024-11-28).
> 
> I was referring there to the "or" in that condition, i.e. the "||
> RUSTC_VERSION >= 108300" part. In other words, it was just a comment I
> made to explain in the other thread that disabling KASAN or RETHUNK is
> not needed anymore when you use 1.83 in the future. :)
> 

Yes, I thought that was clear all along.

> But that seems unrelated to the patch here, so normally you wouldn't
> add it to the cover letter. Or am I missing something? Same for the
> `make rustavailable` note below (i.e. `RUST=y` already implies that).
> 

Noted. I don't think you're missing anything. Thank you for the hints.

> (Of course, no need to resend anything for this -- it is just a note
> to clarify, and anyway the cover letter does not go into the
> repository :)
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

Thank you,
Eder

