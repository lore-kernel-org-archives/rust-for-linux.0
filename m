Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99004242D7B
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933217; cv=pass; b=NxBMrgy5JVR9Vvq+M2BFf07UHP3V6xcdJvhkSRQ+Dyb2QJIC0GZWOOGfntDgrCYH8u8bmPfK0WdBSG4qh7o6vEfpv49d3EtE1sRMbJmEiwJJUr1nUFxE2ULsB8o1cOjyBpOVitHxkR7u3tqmDEE4mow8BAkTRagQFl8CwuxIS8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933217; c=relaxed/simple;
	bh=GXuj61UkEy/xhyiQJ6Xp8wvoyVElDlg+WL0SOn6KuyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw6cnoa39aey+RNP/mVijp16VRVKy4tlPDWPKoE9ZqdOn+f6B3fnRM+eOV0vfcuyNBPEs3WI1CsbXsCWTqDTUYE/Z2I9ANT5L0I9p+xphO0p+6/FZw32loMFpdLo2yatN9K0/SUL0DaJWpVgUI0hqUz6dZx2nJKmBnkJ+g9jjP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ5Ec2+/; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ5Ec2+/"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so376529eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 08:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780933216; cv=none;
        d=google.com; s=arc-20240605;
        b=VANtsBUVAVucfOjCsG8a7HB5E82ZfBSeN0t/z5Pbw0FPxScjXIZhh9fyQ1SzIwx/TM
         6N7xxmR23l5PGjpYh7vmEGqEjs7HlZOStFFo+DdokoE81cf8yH8YLeo6EjOIORUI24zT
         3UD68VFkn7/1QWaW+/8R9mwoQLLs60GIUs2YgyJE7Wyf5ctSBGcM7knP7q2lgLmeSbPz
         y19MBBiZiKQxjyQ4jaCte+IMB2unbnVoG9sbFQODGPF6z8bc+2Xdvv6mxhWp84fBHusX
         WyIw2b6BKgZH2MEIjIFtS15x8kcmwgu8gberYkRr/h0kiWhJY3xhn0ZjFz/075Ew0V1v
         FdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbtjgTASVB8n0Zj704ExR3kHsKh640ZRgGdQxOt+blE=;
        fh=mYDSM4bDdhSQf/VyMhQOVHX+/9VGOi9x1YXqcQi1o5c=;
        b=FO/WofhavhO18MHumJe+konfPTOH1JA7qbzdPI+r9leX0jEbJ35sm7GjwyA0nbQdoi
         sok4fP6Emc12+qrJYVpxk8wI9PFDkIyXacQu1c3wqGBg6Fxg02/fD/izLtJOr7eSYxFU
         jWX8timU/6mcadJKHrj8GJONTDhBtKhzE06us7U1+rAn+HzYdEtnqDuIoWL7GsPvXeXP
         fVwrBHK/B7J9iqXv42KjLPH3EmVOM8Au+P24wX+5zLQ28cI1T7k+RBiY7t2fkTFI8nCN
         Tihxvb2MxzV41W+EMJgdUZj59UITzCXKNd8OwBIvIVjRyfimlw/L6D3qX+JsJQXYnrb5
         jl2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780933216; x=1781538016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbtjgTASVB8n0Zj704ExR3kHsKh640ZRgGdQxOt+blE=;
        b=XZ5Ec2+/iXoB36M6RsYvI8e6tl4Cy/0uBvQME0gCf6jOq3RehRv7xqmY1qFFSlwR2q
         FNjLfA87y8KpsVs+fBBNrdLzDrXsLurzaENMgrSHYQq6F1uTqubZ6N6+aHI2hSzbEWZw
         /UbSJt4Z9QiP4ipSLSEN6Bo4r10ANnQiifJ9i4mgJLyfcHgOL+LNSOf99f9852wZymkQ
         8/pEOdvnUyf3SYwrMsUgL5knZ8JBIsQWGqDpLoTZUHqJWyDRlevMiOdOwSvgD5thJr/j
         QVk7fyuxPJY2FwrWVcv6z1+n5sHvwSlXj0EN0wpuRaOAFPRfJLibPR62HyS7s9/noVDA
         TACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933216; x=1781538016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbtjgTASVB8n0Zj704ExR3kHsKh640ZRgGdQxOt+blE=;
        b=KZx3aF046vmCyQeGJi6VM+DtdXs81eYLKmgmhbGSY3mNNvSIowzr9to+gSP4oUrUJN
         vCIv37VJ1YMl/0sIBSNSTNepxtpjoObnn1jyG8SopHTF7Mg/FblMZoVYG5Hwi8SZSX02
         7cgC3uy6AbcPgOepDWbl3bOswX/oAasMQI//mS3+PO/vd+II7tuOJaoRhZuGLEutjIV1
         1Wcmwas6rkT2hJTs9uJSt18fDgKiuhHOMWm0yN6X6yF71c4NyxLi+e/3DEF04xBjDXHm
         dtdOV2J0zxn2L7gs/Goi99WZ8oMiiMfm3mp7jqtc798qoDpH0VmC9snLbEDeKktRwvJN
         FZ3A==
X-Forwarded-Encrypted: i=1; AFNElJ+xBHKMpk40hOcgy+pNv13iAvxr7qXsUMsQ7AXWCpF779G3pvr35kE7OffZFrl0FUQCiFsBmpq7qOfA0RPzBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMlUVmc3VbN30SIAT+ntt1QL9jqlUOposeSwbrAvjR7Ee5p1WF
	FrGJsrdqK31fPgSejGGIworD6RguqL9plmh3aZTsumFJWChPoHdxf0OONKHdkjxREh0Ojvj3S/9
	67SMi7//hVRCq9ebIcStjI/Ys0kt2lKU=
X-Gm-Gg: Acq92OEokHNFzrqpVgm0zp4v+6FFmrK3+002SLRs/LT+XF40CDBOV0ApQvewdXckf8B
	f0z5rVOB0nrZ7iSExutn4Ckk7ywRhGSjktNELWbblKhCG/v4s1cfYAVzB0AX5aS/a3RcIhZyXND
	bflA1ls4yTrGbxTouCIC/m+7t7s5b55mu24DWALtKJ7n8WE8kXv3kck/+ZloLljwPcgWG/bJN/0
	bEgA07xmdR5Wf+XBvemo84qhLZzL3qM0lM6DQGXKS83CsxEMGB7byke0baPQerfLN8ub3KorkZp
	7vREvTlNxNvPSrI6R4fYKPLDMt6CkzoG9KUKiNAhqwzNkrNFBn7tMaXbZ+tqmDqslY33ax5/UNh
	XoZ3sfZ1K+I1ZmCxHfaCf/jtuzfGO91eyOg==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr4123251eec.2.1780933215524; Mon, 08 Jun 2026
 08:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-6-ojeda@kernel.org>
 <aibUgUSlz-p2oxvX@derry.ads.avm.de>
In-Reply-To: <aibUgUSlz-p2oxvX@derry.ads.avm.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 17:40:02 +0200
X-Gm-Features: AVVi8CeA6U7lKrl1L7lilSL1NyjsoddOewvCmiGSVBHJ2r8bcZWQDk54VJo28uc
Message-ID: <CANiq72nWBSTXz8VBkMuf_Bcs2MgZ31nocL3o_s7HYv=HbVK_-g@mail.gmail.com>
Subject: Re: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
To: Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:10=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> Where does the 'libname.%' pattern come from?  Looking at the current
> users of cmd_rustc_procmacro I'd expect a 'lib%' pattern instead.

Here, we want to extract the extension the operating system uses --
this was originally added for macOS build support (Cc Tamir), and is
`.so` in Linux but `.dylib` there (and if I recall correctly, we
couldn't force `rustc` in macOS to use a file with `.so` as the
extension, sadly).

In the commands, however, what we are trying to extract is the name of
the crate instead. So that is why one is `lib%` and the other
`libname.%` (a dummy library name).

Or do you mean something else?

Thanks a lot for the reviews! By the way, I sent a bit ago v2 (it
doesn't change much, so I will pick your tags from here :)

Cheers,
Miguel
