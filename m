Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85033F58EB
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798114; cv=pass; b=TEHN9LQEDGpNtdriAsenCdCCwrVE4CeIzaXzsVhyqKivLR0wITmOjUHrNecX7fcaXHEaXbXcOMb/f/qYcE5PAWp8omaIOZHN5tmd2P1Y+DVszQTmoDueFFQWuuX4LrHLk4wu6HNKtSW8XF9XbH8FFhne+vI7ar0Qci0hfrmSceo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798114; c=relaxed/simple;
	bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaneZXeFBCecKqOXTnqsi4QC4a0rlKt8CgzZnB0ixn2q465QVtXvqAX7uzA1kq/oWEM/4fdnxTrCyjg3qfWquWIxjx66zLA+O+z/1PhL3BA1clBjINCl5g92Ok3lvIXNP7dVkDn9S5R1sOFKtN5JyVN0sf45SZ+shvdXqpUIF5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIf7xqp5; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIf7xqp5"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f53c6af46eso747297eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779798112; cv=none;
        d=google.com; s=arc-20240605;
        b=cMce2V6zFbsIeFPDjamkxhOPDETbvyqeVH4JQLBLR3QsofIStupG2783ZwjLPeA5RS
         BBHMw6wypuay8M7AHPwTP31W98t4hQIknDQ3DnUINXvTerQV7CS36PYBwzyKrutV37pQ
         vWOVeIE7hFidWIys5529KkQcfbIQRz3j7Bp8XfFJtiZu0KO3EQuAtkjvHsSjNng3olnz
         kyveunT+gRCu7s0dLagNEOl6BX/BsyyS6koiwx3X+38uhs+J5kYKihlzPwL6M73X2ltJ
         fXTgmtoeHyVNbaiAa1qTxY7+GdrcVXy+BxR26Ty2+9REtS+TVLT7IoJ5yha/6Up2w3s9
         myBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
        fh=3jfJE6b6hqVZYA2cgeOnE4uebHrFDfwD2mi2TAk8BkM=;
        b=Jis7p4DBxj8YfCGwYENqxJRD92Sr3ssDALgBNNxF9uwA25vTWwHCtLBPP+kKI6SI7A
         QUM8/UPnRCm6xqyNl4rkW+NyH2yEBaJ9TqfO59oevgc025yCXQ6MWBihNtiDov/e/bDb
         dXVpTgDeaCpIE9fLGjMO4t78UGLTBn5ZvaEIx8jq28oBLkJPKGs3gGAuMXbb1gb8UXih
         F2xtNhfUw5DJ0chOmN4s7w6msaPZMFYtAUhYhL2us0VxwnTpQ68fVjOyIGKweH4g7TO+
         mkuK3rUuRqsviHGdjBtlCmJ9n9v08rOxH/S/FueBJR7pzznHWzIa/fnP55ifcQOxVov+
         GLAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779798112; x=1780402912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
        b=EIf7xqp5E0DS4EwgLmkhODUsiSuBLTmZXmANphbEGipezp6I3ryhvTYm6hcUWkAPmL
         hcVL8qi6SfLapkG5wxjGA8h5GNtyXzTJgMhs26MJ76NQiFgZ/O1lgKKvqqwKjfigTxu6
         fhTSzEbuC6UYfg1S/n8v/SHA1tmpjDlpa/YNGZCc10uscusoNWzvCoPgugmHD7jxBJ06
         ooV1J2M9hsoIvJMJicRR4PB9kBPJpuDB2BejVq2QWcr/eahwxPehZRybIkiyjgVMTzTT
         NPs900PsKXBklzhh30Fs6xUpu62Bd36QXqvs3cK23ygfm6F/1JdfvpCyBNuNKxCvqcaL
         VNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798112; x=1780402912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
        b=K/SsKoP5lUzk6/NiKbrT0XCVozmVzdT/lEz/D/hQ+k21W0TZMvO5f3JFFvKt/zyZoZ
         8EGPio9r4wVA4BZftIWd2WNmMKemusMjPtWvHvfzdwVu2Wj5ilKB7N3ZpV0khCbwheFf
         9iWT+DNumHy4O29ec0IB1QnZK+/ln7c3kcP38qwaQzTKJS31yP4Ral8qbEwMYyCOwcoN
         H+Lc/QqMmucG3xyxtdGMGu5Ic4NE4qUE2/ZAXmfG5txwaTTc/OleJloKP+e23rniU9nO
         jnd0oA6sqJYxj5O8hWu2kab7lLZx6X1m8Q2cLgdlshFBLFxZk8bBWmL6k3FtLr0esb2b
         plBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PKS5ZkJTQevKlZTdw2m24Wapd25DO9fY8K9aRKaZqXZvHcSc0fuBT63ygZ87vY9koXu8lJ7/bDgHM6X9Nig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxuDuKSrkqKi+zJPhhpd4lAKCIZmOK3c03MAIHglyDwEZVgYa6
	Gl/0FaVDi4XZYFvgtO5UKQE7EbYcTsyt7YjXqgzVfYZXQcbnI/m2GGNz6/ey16Tl7fnZLPdyvXU
	dsdqsH7F20dfJlmk2sf+E7Xiig2B4T98=
X-Gm-Gg: Acq92OEJCLqK3BVJkajp3qX+E6HrheTeHkFd+mXE9rRCdOB3Bn0l+ZBc4lKbOvir19/
	vWzv0w9zvqtc6y8GUSGY+Vx2qnsPXYMQCqV/uDG2LaM9LHQ8q1pVTXWw1iSlb2nORIESlL3f9Lg
	BMm0m3J423gQce2g0zmyrPjPvg/lnGvOR0dNJbc7fFTYbP/j//okZz5+GChkxEQMkUnf08pXoy0
	veug13dUamoYVZn+wTE3BMD7WP7wuwf9sTbrI3v2tb7Hyb+f7ugnQzVPODdxGiHyov11Ia1d8tf
	ByihI7eJfd40yFcd9IJo5BxtE4gcoLJI/ArKIFmHXwN9CH0bxrINYgzh/SfA6Q8YyHvzN/Xz10a
	3aTlYALILq5mYzaTiRkXsHUA=
X-Received: by 2002:a05:7301:2c89:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-3044912c779mr3837047eec.6.1779798111828; Tue, 26 May 2026
 05:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com> <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 14:21:38 +0200
X-Gm-Features: AVHnY4JzDBCz65LWfOhQbkvjD_WZ3wkgopiTtJKdM9xbh9f_3NlkdYUpZbBQgqU
Message-ID: <CANiq72nr8AX68THHi+7u6uU=TshQGDSjT7FVRBpMRfXMz7TyHQ@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:53=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> I wanted inline asm be stable, I was skeptical about inline asm to be
> unstable and potentially messing up the whole system. That's the reason
> I waited for the stable support to get merged before sending out this
> patch series.

Yeah, sometimes unstable may mean there were remaining issues, but it
is also common for features to remain unstable for a long time without
no changes. So, yeah, we should at least try to know what is the
overall status, i.e. the latest changes that landed regarding ppc64
inline asm, e.g. when was the last time a significant bug was fixed
etc.

(And I guess IBM prefers that it works with more versions rather than less?=
)

> Yeah it may be true. I'll test out the 1.85 rustc and come back with the
> results.

Thanks, that would be great.

> I am not aware of s390x way of approaching support for rust so can't say
> anything about that.

Ah, OK -- both series added the conditional to
`scripts/min-tool-version.sh` and both are from IBM, so I was just
wondering :)

Cheers,
Miguel
