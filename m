Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DA1D5CFE
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Aug 2025 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755959536; cv=none; b=AN+uXnKBpU6L8E1ngF+7jSDBDW2ZtfwxZRaWKAu5Dkg22Ua4jfQa5AjcmXUNUDmxoLX+mihF07TgPXvGSxydHJw54D97AlsZS19EJ8gMMsbImXHCO9R/L11q43gy1ylntQKqvRdBEBW8X46u6y5sMcRenorcTsYOzTEAaFsAJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755959536; c=relaxed/simple;
	bh=5CH9lXjTQZVNX3mX682b5U7dYvOQ+fFVPT7IU4f0eHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oT1DFYkpYrlxk7lD7u8Ki1JRsR3kmkBtsnbFgwIlRSRYtbWoIwYfVqV03MLG/q1UwtX9E5glvAP6pw+9IIkiDashl49sqa7z58VcDutIvL66FA0WoWhrXbYoJPwAue+RWn/MFtowoGPnfTxwHwxG6Rohl0mOG8uw96wySbhuOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=n1ot0HBE; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="n1ot0HBE"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e86f90d162so331382785a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Aug 2025 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1755959533; x=1756564333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5CH9lXjTQZVNX3mX682b5U7dYvOQ+fFVPT7IU4f0eHA=;
        b=n1ot0HBExF15JRPvCOtJItukkxwHwTURFfVrYEyDp6YbNBYH33RSxqb9nMHWSNDvV9
         qoD56gqqGQJBgt2Gr2OdA+zk/PgID+MivDysrdJ0f2XcewbACO+RMZlGtbfRYdAsMp48
         ECmJ6aqaMu8iFOsch2ljpgv/4svnZ3/JPn+wiBBXOd1VIMokMHAsul19wa0Z4ssfSl4g
         6p7pMeHM5S3N3sdxyCry1KJ8LZhBmEOJTkYX+Z6gPPEN5uyrmIpbH0ZUQaD+5UlJYczZ
         6ktinjt/6BF46vgx/kTatcyLEIr8voC/Vv1vUwOM0r/EDscpm6s3rEOAwTUEBpPQiRTF
         DtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755959533; x=1756564333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CH9lXjTQZVNX3mX682b5U7dYvOQ+fFVPT7IU4f0eHA=;
        b=jVnj4/gCTYBd11P80bFSFuyc+A47oozEoB4bwvpI53eitdiRjf3e2/s4B9zDR7pRn8
         CIpLDdkpq9RuN/zicebRGjfQpu/U891SqtLiXUZ87G4PBSJITQvzp8SL1rquKRpCqpPD
         AK+FgzD7Kl9bExD/9dTUHs9T/Uy0hb3CnT7ARTGom/dKRmO7/ynuxbRNWvKcwEbh81xG
         WFt5PCQZ8BWm4X0n468DmnUy/ZYSIOkW/8bB9BlxcOlQpF1Wt0Y0DwrDInspy6wMNUJ0
         wy4SIKWcclYH2ACw9/fIWbOxykrKj0yx4Ob9D12dstHCXgChbsNqE/JCzld0xT+kji9m
         6Wng==
X-Forwarded-Encrypted: i=1; AJvYcCW9D9SaQy60ihspltbVgN3YwO6AkwTjmYgWZLRSlieDogHlME8jJ8xRCaPx3olnFS8SAVZu0EcgREPRXoFoJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZQpYqCqpdW6S6Jo6hGjE6qjCWftx03kR1at0ZvNnTtZSt9Uyc
	kEjI/kqgdI7dz3b+dmm5qnzkPq/RVfg3A7xZKLdvrWJ+x92TWeX4JjygARKXddLq7jE=
X-Gm-Gg: ASbGnctyzC2IVfG9bLQm78KyQ5aEEM+LYc+pt6BytdAxqP8fjuIZ+QrwvhUYpGTLfsY
	NR2fhr+l0xTJ7ubhPlt3PsdeFe+x7cPfupdgKvBev2z7MuEPHhXVr0khosYvPSS/qcZZtpHWWRP
	IhzYbBMXdypfbK82ogZxVfWpTdG8hhKn6IoBa2cmpcukwEiV1rH0mW9y443h+6uRrbSPG2n5oK/
	dtReb4PIPkDo4YB2cmwHTMN+u6p3tKDExEd9QEmYORk6zKNJ4DHNP4LrzF2R5BZ2n3zshLQr0Xw
	787lwjhcbodv06Vm9QCwZbLYRqeTlR8GkPa686KpxDjKAdXcbPFQmNOEFI60Eb/1/Zzhz2e1
X-Google-Smtp-Source: AGHT+IE/djxgc7wwTAcnCMpTeoyA5tWavDQqRByv2Dt0CCe5t45gjXLX0PKZfrUUEK/TsOhKJSkN9A==
X-Received: by 2002:a05:620a:459e:b0:7e7:fd49:b0c7 with SMTP id af79cd13be357-7ea091a22fdmr990347785a.7.1755959533345;
        Sat, 23 Aug 2025 07:32:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf4361caesm155711885a.70.2025.08.23.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 07:32:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uppHv-00000006Co3-3cJo;
	Sat, 23 Aug 2025 11:32:11 -0300
Date: Sat, 23 Aug 2025 11:32:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, akpm@linux-foundation.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	abdiel.janulgue@gmail.com, lyude@redhat.com, robin.murphy@arm.com,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rust: scatterlist: Add type-state abstraction for
 sg_table
Message-ID: <20250823143211.GB1121521@ziepe.ca>
References: <20250820165431.170195-1-dakr@kernel.org>
 <20250820165431.170195-4-dakr@kernel.org>
 <DC9U87GQ7ONZ.1489DEN1PPUAC@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC9U87GQ7ONZ.1489DEN1PPUAC@nvidia.com>

On Sat, Aug 23, 2025 at 10:22:47PM +0900, Alexandre Courbot wrote:

> For reasons I am not completely clear about, the number of mapped
> segments on the device side can be smaller than the number of
> scatterlists provided by the sg_table. This is highlighted by the
> documentation for `dma_map_sg_attrs` [1] ("Returns the number of mapped
> entries (which can be less than nents) on success") and `sg_dma_address`
> [2] ("You should only work with the number of sg entries dma_map_sg
> returns, or alternatively stop on the first sg_dma_len(sg) which is 0.")

> So only calling `sg_next` until we reach the end of the list carries the
> risk that we iterate on more items than we should, with the extra ones
> having their length at 0

Correct, this is misusing the API, and I don't know if the lengths are
even guarenteed to be zero. To iterate the DMA list you must use the
length of the DMA list returned by dma_map_sg() and nothing else as
the stop condition.

To repeat again, the scatterlist data structure is "optimized" and
contains two completely different lists - the CPU list and the DMA
list. The DMA list is always <= the size of the CPU list.

For all purposes they are completely seperate things and we have a
unique set of iterators and accessors for the CPU vs DMA data.

Jason
