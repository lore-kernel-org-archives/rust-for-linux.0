Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8336C9CD
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772472536; cv=pass; b=JYP3cbfoAScJJJiVciEb8sevrVCBj79soMxqmYxbTUvx4BBEFDK+DglhMyeY/Z6++XhlgHXrXcgUUIbPmIcywhVEAdbTcdnkEWxycw87047vq8fcGYugD7Yz6jqQE6JxQaR+WlFb9mXauCXdJZZtjzA6u3TaGDa6CjdbxCLMpV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772472536; c=relaxed/simple;
	bh=G3n0b90DzB04tYV40Bc9lDxOunyy6wXi77KoBPjFJew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lm9wKksvy/U9D9/wSy0bFufd8NHIvQ/TzvpgEIxPl0fAuviE4FSn7gy1xJRBmvAaApue71fr2brmdWSq0qVX8AOSYQSxc4pxLQsX1JF3yVItx8+tO/9HtEQiJGyhkhwih/YhXbyVyBRFAw2CQIJpCpt/+jUU+x4GJt2ZWycxaoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yLaJzPgb; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yLaJzPgb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65f93fff5c5so26395a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 09:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772472534; cv=none;
        d=google.com; s=arc-20240605;
        b=H2IBWxBcpVdnDebwvR8Heh12A98DI12KhMmeL0dXizR7PTeUe9H4XMEkx7cg3PJTK5
         jaqgSFBe/1brf01r+xFDBWtfSXWLJ87Um+DM4DWZk6aHHPowcLpWKklX3WaCkUmkm5kF
         g7+HoWhkpT1XaCdRFDM+GgqVkWuxVmsUOEDshs1lDuCE9J27NkCS1A0jqchhWbqjl7MJ
         atcX+uV4eE1N5g90gM56qmZEjylh54Ul1psMyWVOBxrOXOm7cIU33BlsHGTPv95aoJB+
         4NwKgbMlGpdpPD/d1OD/UIggEE6Y0Ti6/ESFgiXG1fAAFfcmM5ZwzN5droIRQguJnbrA
         O9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3n0b90DzB04tYV40Bc9lDxOunyy6wXi77KoBPjFJew=;
        fh=g1nYsOk0/56A//RblT4+eYK9zWiCK9HQOk4c55rFGoE=;
        b=XZrNwGqnaVI60R5DMvvloB3UXdX9XCTa3rOXVWKSRj6EdKYAoN3vJRcg2xLG/CZoGF
         zkTcO/OURRrvxZX+DLnxlENSH5Fx3PW2pvqMyoBfQK1qy7KzHmDew5kgZJEdd/K62eW0
         NCN77QuMTCgZHWURYhJLslBX1DEKdTXHIeba4WJvU98VNftU87R9GOnu3MLBbEDmnUl6
         QEOxfN2CJLq+LdWLulvKeB2IU9Bruavp7zc7fk7GMrKckREUuu3oOPS3lial12Ds53Jr
         p6JLuA4zEVFDDluqB3cVFm2qNc0etXkIgATdFCMXN4B0kzFDDTltqrm067t7RWJIntq/
         D52w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772472534; x=1773077334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3n0b90DzB04tYV40Bc9lDxOunyy6wXi77KoBPjFJew=;
        b=yLaJzPgbpwstyVIdBrsY+0JevJta8OWA7YfDVmqIm5h+nYlVCsl3KUP5YV0qKCXJ9Z
         iyPHFK2Ifsn7iiPBlq5wieHJ0cyhIdj+bMqw5KmhVjLP7yjX6kqow8ed2CZiqSIohZKq
         5dprM1j9t5I73CxS2ROQWepQFyHzQwA0y8BkcvF8cFB1zHkkTbFzFLnwNEsg04GHWxVC
         ERZzB82RIWs1N087uy31YWcO1DocAGwZzaxstQbZwLgsfTYMMq9Kt/t8UccpkxisWSwy
         pMQbAdfbqxNk5TtJ1e7qFxAPYj+p+L53DPuWpCRSzVoknVhmh8PV/zN4FDGnKWsrKdhd
         EQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472534; x=1773077334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3n0b90DzB04tYV40Bc9lDxOunyy6wXi77KoBPjFJew=;
        b=lElE6mfHoIkcedX+JiJuSBRtiPFdebQS8H/Q+IjvSBxGFVz15xmAluXivAmTR3j/8/
         +U/lLqdyZDS2L4ZVj1I0eGMq0CHcYv0GndcWeTRKgjg66rWt/cXceiqe3DdtVp7gT6G2
         zGjFY3oiiwttQMqAoWlZOXamvjTxBfDH4x1b5qwONqVk7Edy3GUnJvOMyHRBRxmvzOtx
         srlUBxWPTGKAhHsrPG6ThM4tOBpRMDntnEY0j+0t3BMUq38E0mrkOjZjkiBSc2UeEGUH
         9FmXb6qR5tn30IXuzLk4IvKrVEidOV+0UjkQXfHjTryva6he3qtUeAp9SXJttA3VPdH0
         FB2g==
X-Forwarded-Encrypted: i=1; AJvYcCXnWYAe/9lFJ6vuqmiqpLEAzJwIOZeb9khpoI5reSvdWy+4vnjRBrL6VY5ozUWp8ma1XYRaEY5kj64ilSuOSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxChnh5tsgTdOgj+F2poF9m9I2hXi7oIdJSdCgjZl6PZdkrvHBH
	32DXGrHyeZHHfe9R2Ujhc0Wms4WH+WFWqL54ivzNWaaRM2T0FBnq/A/QOF3rKqmD5yibL3Nd3z5
	/nVvbbSHguqRK7l3vOlJW/bjq4GlHvhJQS56+fyQQ
X-Gm-Gg: ATEYQzzI7UUz7QkBmV5WmLGBi+Z38soaJhR2BKsfzfjBe7PZdB50vj4eNHjXEcvj8xB
	HNsPDkJNWcPqPiwbpiMmItAZaRgHkgq0/2ev8UKmb+mb2afxACNJhed9FqDgiVd2skdZ2+Ij5Z5
	z/fPCQUqJquzFS59H3Ce4GCQud/T6st0gPift/IGlS/hNfIk76e8zBIE7uHBcV39D1093YlNzOl
	Af6DfbVxOaRZ0cK9sRcxuCwMYirlhwqAzR7kOZRtfG0k1TeKXraBbkz8LpU8jzpblLrBf1xj4FE
	XPTjoCh9ga9fpG11ZkuQ6pRN/oCxTn3oCdRK
X-Received: by 2002:a05:6402:f12:b0:65f:ddaf:d1c5 with SMTP id
 4fb4d7f45d1cf-66008e0a08emr235858a12.12.1772472533625; Mon, 02 Mar 2026
 09:28:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-binder-vma-check-v2-0-60f9d695a990@google.com>
 <20260218-binder-vma-check-v2-1-60f9d695a990@google.com> <aaXGZlfAmk-DCuBW@google.com>
In-Reply-To: <aaXGZlfAmk-DCuBW@google.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 2 Mar 2026 18:28:17 +0100
X-Gm-Features: AaiRm50SZW8QPqSRhdWDXBgdsHpRSfdrfGzv3dpf9ThjwdH9bYPFTN50ijeQDLs
Message-ID: <CAG48ez2M4fj15gqyKrP7ADRUhNQZkpy9m+NSz2N=vo=PSefm0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:18=E2=80=AFPM Carlos Llamas <cmllamas@google.com> =
wrote:
> On Wed, Feb 18, 2026 at 11:53:26AM +0000, Alice Ryhl wrote:
> > When installing missing pages (or zapping them), Rust Binder will look
> > up the vma in the mm by address, and then call vm_insert_page (or
> > zap_page_range_single). However, if the vma is closed and replaced with
> > a different vma at the same address, this can lead to Rust Binder
> > installing pages into the wrong vma.
> >
> > By installing the page into a writable vma, it becomes possible to writ=
e
> > to your own binder pages, which are normally read-only. Although you're
> > not supposed to be able to write to those pages, the intent behind the
> > design of Rust Binder is that even if you get that ability, it should n=
ot
> > lead to anything bad. Unfortunately, due to another bug, that is not th=
e
> > case.
>
> This all makes sense to me. What I'm missing though is why not reject
> VM_WRITE mappings all together? Is there a downside or something that
> prevents us from setting this check?

You could, and it would probably do the job (assuming that you check
for VM_MAYWRITE instead of VM_WRITE), but I think it'd be more of a
surface-level mitigation than a robust safety check - in my opinion, a
robust check should, at a minimum, confirm that the VMA being accessed
belongs to the right driver, because other drivers might do random
things you don't expect in their own VMAs. (For example, it wouldn't
protect against interaction with a driver like C binder which reads
PTEs back out of the VMA in binder_page_lookup(), makes assumptions
about what kinds of pages that yields, and writes into those pages.) A
driver should not be touching VMAs it doesn't own.
