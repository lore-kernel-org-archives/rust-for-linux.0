Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EEA3BD64C
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913677; cv=none; b=XgguKW6EQLQOMYIOELPyx1M8vIPI0ELcTt+OaWCqAobjXnsRcVpBmzLiDAJCitcEIh132bbGp4WpWRBomNFLWh7vA+WvVnvj8gohyABZIMxPG0SeW+ScbPy5R+Vx/pIp89g+chw3huln63GTWz+79wHf02gGdTU3Y23MZue5P80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913677; c=relaxed/simple;
	bh=TAG+FJb1OmGkLdmZN/Vtoi2eMfsxCj3Wgm6iaqGmVUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Frk7SS+iiTYFOiFquzXsuLvAa86fXGyvlPavVKeNLymH/Wola/IJFnzhDJD/b1zyLdD0JRzrX+E3iKEXxsgno2rOWDamFBT2BLlw2/kVVKwPO/sa2AZ9c0CSkB+Hgr28wDToHYhq4AkwRkVWwj4eD7fgRG0WOzsnuSD1XMYttbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtBSOdA+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtBSOdA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0AA1F00893;
	Mon,  8 Jun 2026 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913676;
	bh=UpsohUrj9MGjkopMazUx2N4avwExDnI6+pCGiegcZ+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RtBSOdA+/5OgIN1ftJj7PhL6ZmezCcgCjG7hPfXXJYoyGq7ruqxHVDY97iEYMJ/vA
	 r65qlGAuQNXLE2v/Rdgbly8Znz1V0Hbfm22/CnZBvZ2FuitCbQpJ4mXY8XASJqubIi
	 uwyzKuEkNXyLgxqMyPU23SMWjBzmeirIY629bun2n6zSfIWB3cTjx4Cjyu9Z8A7NLq
	 g7pPDvxKRLQO8F5EFUqiiqTcVjYlHHqGID0exAfuOHsP7WK9Enqiu4PS3kPlf0fpNV
	 paXOnTX4/Enl/YbEvDroaidZRcaPhozkZFj/E3fQ1ugji6nf+J8SUbHIC/JCYY0TsL
	 uoS39NER1cCGw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yuan Tan <ytan089@ucr.edu>, ojeda@kernel.org, boqun@kernel.org,
 rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu, ardalan@uci.edu, pgovind2@uci.edu, dzueck@uci.edu,
 Yuan Tan <ytan089@ucr.edu>
Subject: Re: [PATCH 0/1] rust: block: mq: make GenDisk Send impl sound
In-Reply-To: <87pl25i47i.fsf@kernel.org>
References: <cover.1780633578.git.ytan089@ucr.edu> <87pl25i47i.fsf@kernel.org>
Date: Mon, 08 Jun 2026 12:14:29 +0200
Message-ID: <87zf15gwze.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Hi,
>
> Yuan Tan <ytan089@ucr.edu> writes:
>
>> Hi Linux kernel maintainers,
>>
>> We are developing a tool called FerroLens to detect potential unsound
>> behavior in Rust code in the Linux kernel. FerroLens reported the following
>> bug in rust/kernel/gendisk.rs.
>>
>> Gendisk is marked as Send although the fields it contains may not be.
>> Specifically, the QueueData held in the raw gendisk pointer may not be safe
>> to send across threads. Therefore, sending the Gendisk from one thread to
>> another and dropping on a different thread may cause unsound behavior.
>>
>> Additionally, Gendisk contains an Arc<TagSet<T>>. This Arc would be Send
>> and Sync if the underlying TagSet<T> were Send and Sync. But this is not
>> explicitly derived, although it can be, since the API does not modify the
>> TagSet.
>
> Thanks for the patch. The `GenDisk` `Send` fix looks correct to me.

Actually, I think we need a bound on the Arc as well:

  unsafe impl<T> Send for GenDisk<T>
  where
      T: Operations,
      T::QueueData: Send,
      Arc<TagSet<T>>: Send,
  {
  }

Best regards,
Andreas Hindborg


