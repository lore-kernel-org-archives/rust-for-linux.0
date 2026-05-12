Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAB399888;
	Tue, 12 May 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596144; cv=none; b=FV32CqYHh6WatiHBsmNSJ71qvcpM4xoX/6t0InKMbmVj9nfi1h6Axmxm12fmeO8D5SEAItHmRavaOOBBnwyo3uEiGGtk8jFqeRw3jkqBlsfXY95nodsJSTqoy/hApzinff0Kt7PB6X1mOQ/t5OOxyISZNoBxLkqvnxeNYSH/5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596144; c=relaxed/simple;
	bh=ric07noT42vmAynWUGYhb4NN5hRXNIXg1b6JzjYj7cU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JcA6soIT22Nn+vAGS9pQCbRwXPxyp9SxLnG573kt62rJzNMWZp1MVK7Y58KCnb+RJWRDZ5YuIvqFQHfx7dd4aMkrUzn0shUyuwhmZrpi16sfstSRxtjrlkAUI+Vy1cFCzcKzDuh2KpVTr6uYGzqD/r2MSu6/WhUZ3NDRa/DnBno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqacW8XC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqacW8XC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB6EC2BCF5;
	Tue, 12 May 2026 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596144;
	bh=ric07noT42vmAynWUGYhb4NN5hRXNIXg1b6JzjYj7cU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mqacW8XCrOirE1k6SBMUyhGNFGICtzbiSnLH3uDpk6E9xn/+hHptFErMQ8ofmPnSn
	 dfyJ1lw+kf951gu3Y1n3hEhtQB7woAuMQCCFOVBiUFr7ab6tKe1L/KZSQFrIbOEXIv
	 9yCvobqPDK4n5nXzEsRCgUXJgJsY9yWNN7TCvTnQPAUZtu41Lxzw8mp7qEBZPUWoU8
	 td9R2t/f6HHRtVameuxElc4ooE8KKesAbklRTUU/FaZpDYC3N4ln7V7gmmdIggon3b
	 t5jrhjtxK6ejbT2jZeUze0aMPmqF3RfMBnscvfllkKw2FPhZoyQ2YFCavBWExMsRQs
	 oJko2Z5F4iILQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 16:29:00 +0200
Message-Id: <DIGRPMX66CLE.1RQYNPA5OXP97@kernel.org>
Subject: Re: [PATCH 2/2] rust: alloc: cleanup doctest imports to "kernel
 vertical" style
Cc: <ljs@kernel.org>, <vbabka@kernel.org>, <Liam.Howlett@oracle.com>,
 <urezki@gmail.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260511214154.3569305-1-dakr@kernel.org>
 <20260511214154.3569305-2-dakr@kernel.org>
 <DIGRC3P3FDOB.YA7DAMG3A8UR@garyguo.net>
In-Reply-To: <DIGRC3P3FDOB.YA7DAMG3A8UR@garyguo.net>

On Tue May 12, 2026 at 4:11 PM CEST, Gary Guo wrote:
> On Mon May 11, 2026 at 10:41 PM BST, Danilo Krummrich wrote:
>> @@ -174,8 +174,11 @@ impl Vmalloc {
>>      /// # Examples
>>      ///
>>      /// ```
>> -    /// # use core::ptr::{NonNull, from_mut};
>> -    /// # use kernel::{page, prelude::*};
>> +    /// # use core::ptr::{
>> +    /// #     from_mut,
>> +    /// #     NonNull, //
>> +    /// # };
>
> I thought the consensus was that hidden lines don't need to use vertical =
import
> style.

Don't need to, but still can; I generally prefer to keep it consistent.

We can drop the - for doc-comments - unnecessary '//' though, which my musc=
le
memory inserted regardless. :)
