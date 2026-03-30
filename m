Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D413AF676
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862530; cv=none; b=SYbvXyrx+5M+atPBRW2FHZt6i+7z6RtvBrZG5Y5Qgj32drmkon8oovscDb38td+bdHBtLzpzCh+XJI2zdqaePOQB94CtrERBTZF2N/xZQcBF1smbq4uMmYm2hWA0BkeRorGrFBsoS6qwA6HgtkveYtZzgpRwi+ekyfBW87uTGzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862530; c=relaxed/simple;
	bh=b/Ob6UYhR6x+koRz1aWYKhC0kLOah8bN/2fVSb/0yEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtcZOoo1wgMJB/HKZ+rcKoTbFpgHUbvs73bRTaPJlAz5CAAd52ztwk+P+14xhD56ejB8+M5zSCQNCmJsicKBPy7BMwctYJX39BbTcKwVLnitwXILqlr48yLChS5tS5XdNLS3sj7dhvDKeOXRIw+v4/oys8voLW6Soz7e+tbwguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vjog3gVp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vjog3gVp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b2429f98d0so11133125ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862529; x=1775467329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVgspVbKSqNvps5mZhjeK8culZtZFhhekIg4FPbzFto=;
        b=Vjog3gVpEDv8ZwDHK/3Ph3va6MyfOR1pqwF97thoAAcvQTX+wpkwYX05ivnqUmvga7
         UC6BlkT8JnJwJmxoRnWq3rVMPswVBnnNbYzSLn0ikXpe5R/viRIGbH4XfvrN1YUwjNkj
         pWl2oGi2sXBbzmyveCSR0ZIAIsnn1jJSA7fQ2qvKvt8WDBNnLxWWOjW4vixF1kGgIh9v
         78A6S6QXLcLmL22fqNzdyxGS1Tr4DGiFtoSbXMirvJsnFAqNJelPENtKLOQJwOay6KV2
         18GQbqyRTJruVFz2ANr1vZlxxQr9wGltH1Ex+6fLE2B6ldFRC86zVva8nbJFd784C2W7
         rZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862529; x=1775467329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVgspVbKSqNvps5mZhjeK8culZtZFhhekIg4FPbzFto=;
        b=idVeKxO7ed5ZljcBxepTNO9eqYtOPJb502JDzbm83+0cnCQdZm8k/KO7kLELiHxR8u
         SoV5tHVR4oOjkG+pFMwYu0nJM8/kkaEaWUe9xfm9xVS7E2HGbpkdu+2XNlFbXgABCJyL
         5BEtunBpq5FSDQusmqsSqnjXikKaTzP85g3iXSh6W4AZkFzBTJF948Z8UigYmznSECv6
         yZowX4Div3VOm5SbhODsmuNFWthrxf4bBJNFBkZh0ASDMZioVyzX9o9PfMqObGmYIkYT
         bUDVbM0IvnLKx2mTK3gpx5RxIiZLNY0xcwBITJa+pw6waGGnWh9hjsVpS4bzVV7TnI/5
         Eb9g==
X-Forwarded-Encrypted: i=1; AJvYcCWttetkoQB9zkHhVt2hz5V+Zo6OKuectJx1wBVtTTKcFVZbzxuQ9/ilRAO00iKSKfdI9I/P/OV6gHkk17DDUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvMpmRibN6pdp72upk/Qf4f1HAFdsKkyeEWpjf/f51xFDj0Z0U
	92u6Zb1FrCzhVdg1Qn7iBWeaPrORwu9WmqODus1rNpeRSgFtHcZttehd
X-Gm-Gg: ATEYQzyFJiJMSkjVnfX81xRlcIEfsdQIwXyaJnnpWHBi7qAOsQyRuiIlYB8HGYhJaPi
	34tOu3c9gl1NAox4SWcxTxrA8fGGQg/mZixyIMQw7oaHkolOrkFnzK0YW2BIs5ofcuPmL5sQJAt
	SIdST8vkGzhDs8vgdqSEiIcrVWirXHKRHzHFWKrGZ+SADwByHDzWpC3ZRSRL4qIKVph32rfpBUm
	3Iujk6hUbGphQ+IuHtXrpMJy57mkLkSd3tm5mRGWxKOhep6fvzGiHwyeMF811jTGKE5ko+kj9Rp
	5cBYtli01nZ7E5qDNzujwh28D+zUqd3XwZ4/6SAIFOSoMFLT40av7/J6dPNRA7LmzqT+olsyKrq
	fqNEayhchy7acRPgQ4RuR+oKJ24Vg//3dEANfBymMWex/OVILtfw5apjC0taAZgHuXIHn8zRpCB
	Am20lXvond4c+gsP+udx41vFTi/7CNVkp8+DchBYJneFBywPkg9CG5Ex5vtkGlldl83i8=
X-Received: by 2002:a17:903:8c4:b0:2b2:5091:1c1c with SMTP id d9443c01a7336-2b250912298mr35392955ad.18.1774862528535;
        Mon, 30 Mar 2026 02:22:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277fb50sm71477125ad.56.2026.03.30.02.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:22:07 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:51:57 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V7 1/4] rust: Fix a race condition in Makefile
Message-ID: <acpAVwKiHwFfenZ7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
 <20260329160254.2592207-2-mkchauras@gmail.com>
 <CANiq72nxgwPUv1AJhRQSFNWtV+w_a-VqK3VWtjaKncRJkNNETw@mail.gmail.com>
 <DHFH7TSMMSLB.355ANAWQS0N7B@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHFH7TSMMSLB.355ANAWQS0N7B@garyguo.net>

On Sun, Mar 29, 2026 at 07:26:55PM +0100, Gary Guo wrote:
> On Sun Mar 29, 2026 at 6:25 PM BST, Miguel Ojeda wrote:
> > On Sun, Mar 29, 2026 at 6:03 PM Mukesh Kumar Chaurasiya (IBM)
> > <mkchauras@gmail.com> wrote:
> >>
> >> When compiling with -j1 flag in powerpc, the libproc_macro finds the
> >> libcore.rmeta both in toolchain and local rust directory. libproc_macro
> >> should use the toolchain provided libcore.rmeta.
> >
> > By toolchain, do you mean the sysroot one or something else?
> >
> > We should make it such that `rustc` does not try to use them to begin
> > with, e.g. we added `--sysroot=/dev/null` to prevent that in the past,
> > please see:
> >
> >   71479eee9da8 ("rust: Suppress searching builtin sysroot")
> >
> > In other words, we should try to avoid adding dependencies (even if
> > order-only) to workaround the issue, but instead we should get rid of
> > the root issue.
> >
> > Otherwise, after a build, if we rebuild only one of them, wouldn't it
> > find again both? i.e. this is not really a "race condition".
> >
> > From the original message, I see this was happening when building the
> > host libraries, because the targets happen to match, i.e. you are
> > doing a native build on powerpc, right?
> >
> > Perhaps we could put the host `.rmeta`s separately, or something like that.
> 
> Yeah, we can either remove `-L$(objtree)/$(obj)` and specify `--extern
> dep=path-to-dep`, or we can store host libraries to something like
> `$(objtree)/$(obj)/host` and use that instead.
> 
Oh now i understood what Miguel was trying to say. Thanks for the
explanation. 
> The latter should be an easier fix. Also, I can see that we're already having
> `-L$(objtree)/$(obj)/test`.
> 
I'll try this.

Regards,
Mukesh
> Best,
> Gary
> 
