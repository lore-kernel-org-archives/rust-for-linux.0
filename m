Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80AC48CEA
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705961805; cv=none; b=q+MAPkTmNO1p/Ih1QGqBKDtViaC5/Yy2YC8m0OXY5mc6uYzqje0w0jvjz823uPHZ143P+0aoX1qMx4G8vkCTkqWoNA6Qml06/zIhaHQtmG/oaUuTQwsOVbQsGTE3prLBBQlQ6mVC5ouZ0UWfKJZDyDz5dR2xCdBPTunTcUrrh/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705961805; c=relaxed/simple;
	bh=zpHSxyxjqSYyi+Uuf35ROAtNAMm8L1pBJx6LkCld5PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=j4xHgxNGoeRwFtFJVWIcM+LbfcU+wbYFMrkyX4nkfUhizRUG8BiJygLgkQH2iSMyiHTE7K72CM5gizG8AGmGHb92QNvV4rP9NVwCuZWkYopkklI/bi1cpBwIPApvRafecqZ3KCaYr7j54wtUN05tnZ2ZlttqcMQnckAkWDC3ZBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VSPk+y3p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VSPk+y3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705961802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgrZaLUDZX0rpHph8wYR2fbFPEW3Vfi/WSc3wqW+lkA=;
	b=VSPk+y3pMFg3qnD5RKFQKTTovm1b75i5ud4SGTVAEybDl7Umyd8Trp1dvpT3u9Po2G4fiJ
	3FjIStXwLoGKjQe+upeOP6Dnb7oaPOwBSt94oNcUk4V0eRcgqrXfXyiR59++DSRk+2Rx2z
	H8FO3g2Tr2+lYLD2rJDNSgkj+0cEei8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-4um0nFYSNlurWOBtrdV9ZQ-1; Mon, 22 Jan 2024 17:16:41 -0500
X-MC-Unique: 4um0nFYSNlurWOBtrdV9ZQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-339222e46a0so2111164f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 14:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705961800; x=1706566600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgrZaLUDZX0rpHph8wYR2fbFPEW3Vfi/WSc3wqW+lkA=;
        b=fygFPCKrZ84fygIgYYI/bYM6ra8MggCHD0hVisPgq+DqagHMGK6TRsgIiLc2aFVuHL
         aPxy0lhhaLELqPgiIVxPfyT8CJ60dxo6/tBPyePSypjf4PLllyiDlu1gZ468fuLcabDT
         ttFwoBdAvx3W2/n6fE5SPbsgoy1aahPJ+MqlhTwuaYQALiI4YDL5ZABZCdmdyys/xX41
         0GaNXCVoNEWdUjIzTCp84CXFWglzZ793CBaQitFDsOV3YW/vtz57ytoWbPwQOvYrZum2
         CKiwlcWWTTmktL7nBXFA/sHKkejLLfVjFPXaj/+5aiHI4Nx6veF7Erf/BPJy/3WVivsN
         WsDw==
X-Gm-Message-State: AOJu0YygQZGfWstpG5hNHh/6nro/6j4O6f8ujWUOwiUfeDtV7+ypGxnJ
	JAr8BDy82e+xgL1gJdHoR5XpeftKm+T5BFhF6dG3gVx5KdY8V+X/2xax4jr9CdIf7CRCps2cyr+
	QYBzrLe3Rid2l/zANeUac5uvqc2LB94aLtb0r0SnJ3Al9Id9W1CgMn57bAGsirzcR
X-Received: by 2002:a5d:448b:0:b0:337:bf4c:3a81 with SMTP id j11-20020a5d448b000000b00337bf4c3a81mr2380771wrq.75.1705961800511;
        Mon, 22 Jan 2024 14:16:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWdH0GMxWI068JJC+LHDgSL52h2kQAYV0P+HNqImIdsOA1ed+Uxg1v1MOWcAqydVLXIXeq+Q==
X-Received: by 2002:a5d:448b:0:b0:337:bf4c:3a81 with SMTP id j11-20020a5d448b000000b00337bf4c3a81mr2380760wrq.75.1705961800201;
        Mon, 22 Jan 2024 14:16:40 -0800 (PST)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d604e000000b003392cdeb3a2sm5703597wrt.103.2024.01.22.14.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:16:39 -0800 (PST)
Date: Mon, 22 Jan 2024 23:16:37 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: str: add to_ascii_{upper,lower}case() to CString
Message-ID: <Za7pRc1wTtEhObTN@cassiopeiae>
References: <20240122184608.11863-1-dakr@redhat.com>
 <CANiq72kdX-LK=OurnR5ZGDXEf90DxshUX13up4c8kiz0jxHc+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANiq72kdX-LK=OurnR5ZGDXEf90DxshUX13up4c8kiz0jxHc+Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 22, 2024 at 08:38:26PM +0100, Miguel Ojeda wrote:
> On Mon, Jan 22, 2024 at 7:46 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Add functions to convert a CString to upper- / lowercase assuming all
> > characters are ASCII encoded.
> 
> Like Alice mentioned, please mention the use case, i.e. the "why?"

Sure, I need this in the context of converting stringified enum values
(representing different GPU chipsets) to strings in order to generate the
corresponding firmware paths. The project context is Nova (GSP only Rust
successor of Nouveau).

If preferred, I can add this to the commit message.

> (perhaps also linking the Zulip discussion if you like [1]).
> 
> [1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/String.20manipulation.20in.20kernel.20Rust

Sure, gonna add it.

> 
> > +    /// Converts the whole CString to lowercase.
> 
> Please use Markdown and, if possible, an intra-doc link, i.e.
> 
>     /// Converts the whole [`CString`] to lowercase.
> 
> Also perhaps we should mimic the standard library docs?

Mimic, as in copy them over (to the extent they actually apply)?

> 
> > +    pub fn to_ascii_lowercase(&mut self) {
> > +        self.buf.make_ascii_lowercase();
> > +    }
> 
> Why did you choose the `to_ascii_*()` name for these? In the standard
> library, the in-place ones are `make_ascii_*()` (like the one you call
> in the implementation).

Should be make_ascii_*(), agreed.

> 
> Should the new-object-returned ones be added, by the way, if we are
> adding these?

Sure, I'm fine adding them as well. Not sure we'll need them for Nova though.

- Danilo

> 
> Cheers,
> Miguel
> 

