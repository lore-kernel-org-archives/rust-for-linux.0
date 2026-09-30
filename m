Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD44A260E
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768315; cv=pass; b=TSTFSd2BTDLlTPSoowvnxYsk0wVqmIAhn5P8scrfM2TCA8JsPo5wS8W7NXBOAX+c5ce0tqfiXm6Fn27faAhcqgFJe+H0L5NSquib8GzHP1CNP7u7RS4br9YllAcGpqua1nnp8y4BnTpY2Pc+6CsC98oBZEgpebHAklfpBJN/7jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768315; c=relaxed/simple;
	bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RX3RdrT1cKmyqs6YaBBMxC4qeWwmi/sQkY0aDG5n1BUb6cgmV1BAxYTVfVaP4Fd+J7S26yIQanHHe8oAn6MbfdaFO8APOSIQ8Kn4ZHm+LPXg/QC9Bop+oD9nCjuwuyX6Y9NgHxr1h8+2g5wrvrrgwp5Dl4NkVxcXgFggxnGWE8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltshOoYC; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltshOoYC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so189419eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 04:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768313; cv=none;
        d=google.com; s=arc-20260327;
        b=gpyyAG5FyEptS2E1Gcmd+TTRMkcoyJlbIL08kTP0uYIjTGsHjuoj7URHOU2hsFTCZ8
         8uIC5aoQMnVKKvWCnbZLNbuKezyEgwP4opoQ0qw48vDYIe/ZAmKP0v98fULw2sTEqmrC
         VOuF/EafVJgv03UEbjQufuKYlQgJoltdtlFQXqqqK0vw4PXqBaCQIFWvlsFXgGm5dxHk
         UNji0GmhrH1uIOIqiNQc0WkiguzTy50x5CmoEmKgwvlr7z1qqu23CvjjrjyGUbcRxnf6
         +qTXU3UCPPkFADCjE5Yrz2uhECxlE9YETuTQXYc7K+G2p/83DVqBUntricaa/Jya043l
         fPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
        fh=osjGElPFYmtx9VnuBr9Hi3RCDduRK4Eu00g6IOHk9yw=;
        b=J0ZVOpjBCHctHgBGhDKEmQptKoefAqXKqFCqzwjky1s2+YfNSihhvkav/C3lMv/k2Y
         E91JoUteKD+XzSPrnmyl/wg9GvuJhuCUb7+UX+aBoex6cH5efHMh/u+qH8mVClfgrCaf
         B7S08e6xM52NynojA/zs88oQAanTyZvav7l7vW5GFSYYu+bCROOQwC53DNKx+h5O8fER
         RGEW22i8ju1z6vXGP65InorgyTfZx+AaFnsJDlB2FDHOT8IlN4uW+gNzBMuMiJpfk6bp
         tpMQTiCk+72AGMeU1jES7kmSBiEezeVZM4GJWi+NSHW9PXs2GwtqTSr7k0cPL3yaFFlo
         584g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768313; x=1791373113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
        b=ltshOoYCGT9kRU77iyofClFYwAIhur7nJXrBtp9CSfwU1oS2TMtriAydI4cOPxc4Tu
         uaAVol+EH8orEBpcE2RbA/LM1ft9KOKyFlzT4wzpZ+aqOpkd5TnUObWKuwPW6HNEg513
         Pz+OIYwThqWy62vK/s8hwckp2nPIwnwI2NHR808IpsGYKXBeV6+qeMClW0QyvdkmNgFo
         MsCXJpbZnTfRDR8AHuWVccL2HnehHNE/bdpxG+rGARzOcD7oWXbDWGspv9x9dm2qUse7
         59eA8J0yojn6jNkKevNdB2j9m2vEeKfDUL9EY2PcciZOCivYntgbXs+FufGFgi+kKp4U
         pl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768313; x=1791373113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
        b=hvpqMXRVhIGnp4dW05nU70Z40rJhHffBjo8jAnmUa2oJ5wN7atNnKkDCe9oYdH8/O1
         0AUn1TUrg2W6l4lQjIOX56R/BAGvwwF7lKaGDaOO1ZvN+J09vOSmxCSZhKENMgiFZcyy
         LUpF9y/JIO0oiCGb/7j5LfoZ+PxvWA5NooHA3q/wgGuegmqwR9D+bsnhMpAn9YkHM9JP
         FyZh6KErXtgsqGw3rmgIAyO6tRybl7/pMZIfgBXeDAY1wukq7XCjABLhCkQQZBxxqSJU
         /NsB+smiQkPWtX4tyPmJjW+jg+escnipTk6PceF3SMb8pYc9Pz+4BRsMJ4AbQCFEGKmB
         eWAg==
X-Forwarded-Encrypted: i=1; AKwUvBz9/WYY9447s4liWSQ9X3dfKlCYhVtYlsQyp66IY8yWXHsokAvRGtmEgD9GiCc26ZI2RwX4Lgxj32cjVJ+maw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjxL+V9B2DZukjb3ogAp1N0vuXaJU7Hklk7bY/oR6Kxqfvj2ES
	owLc7pWm7yEu4fO8FmeKksRejQ25IJPG6hUYOqg96x2M3+HzGL7CnvnF1B8tZ32G4LBSMiedGqL
	Ib5OG5vAmZrv2SBY7PdzI6N143ifrSno=
X-Gm-Gg: AYBFou1ji8Ab4t8JWvY1bV8Y4h32mQxYrXAegY9n6PndjdXI+Sk96ypjYDRt4YH7fkw
	OxHTxcnTe2BS7DTt88ByvODp6M/wl7sMHmddnSERc+zfH2NrnF6H/E2/v+qYYSKGpgkKvVsOftw
	XLwa3PSkIqT634U9eWS4+IRZglTp0LRGQM5hUCm4LKxjpvC9W8kLndLEmgMO/CydH2QAHimIRcF
	941hgE6OOmMe1+xoXJO0ryISHL4wzqx3uvXDA3kx4xAyKhhCEvP+Ge2/3qpQeLthETtIAHl33HO
	ZNtS7YbuBbhuoTJ2UBX/A+b2hNnK0SczqfiIKPUMJOcsKvBIwbFPzbzmcYuNXsXwwBiVdumCIKX
	lDGFBEFFSqg4O6qkhfYiwhcjb20XT8PNIdXNDe0TRffh2fZvkPP/AKhim+aekgmDzdMzzcpvuVO
	wACeboFMzfa137dWtiiAL914WaSo+jVzxhennR7An1yO8frq9aHwU=
X-Received: by 2002:a05:693c:2808:b0:34c:3ae5:ebc with SMTP id
 5a478bee46e88-34cd60f8956mr2568944eec.0.1790768312870; Wed, 30 Sep 2026
 04:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:38:20 +0200
X-Gm-Features: AclHuK_SpyqhnK8AZ5BN-ONzwML8ISWuKW_9wFvKq7F9Mwfhhlcvp3yTpTzcxJE
Message-ID: <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> The helpers should go in cpu.c, that makes sense. Not sure why I put in
> a separate file, maybe cpu.c was not present when I sent v1.
>
> Do you mind moving the code when applying or do you want a new version?

I can do it.

@tip / Peter / Thomas: please shout if you wanted to take this patch instea=
d.

Cheers,
Miguel
