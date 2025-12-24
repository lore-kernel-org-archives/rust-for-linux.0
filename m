Received: from outbound.pv.icloud.com (p-west1-cluster1-host2-snip4-10.eps.apple.com [57.103.64.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461027280A
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766541495; cv=none; b=FF91m2PI6ryQ8qZIS9LhzUCHxXDItbpB46d3PHg7kHYwi8LcWy+K/aoaglqO27fvH1ZqMI/D3P2CR+AgcVzR7PfL4TgFdZkHy1gMILp2alJGiBaTO6umTsf2AcAzpOsJ7H99EnmUqPCK9AxjMMiwMg8TF2te8vHyqpacTB3homI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766541495; c=relaxed/simple;
	bh=laIFPsPy4DRG7IorCXTSdyN0nV4BS9i7v3imAuirOIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsEBAnXXMM5rZYMxTjf55CCAL+NAcdbOZrJbcc89fqRbdZnXPdl6KR3JDIJpXkEfT7rmdVuWJE9IJw8nNSXLJFG9dOM+YdTprqny7yZ1QZa8Ajintt/tt4/rHrws2bx9Ayqey/L0EkHd2yX2T3pO+UyK5VvdVmRcyY3+NwSmJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=EB1BVtpN; arc=none smtp.client-ip=57.103.64.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="EB1BVtpN"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-3 (Postfix) with ESMTPS id 7596618000B8;
	Wed, 24 Dec 2025 01:58:09 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=7hJ7Tx3lXaT6hxvjC5fw8fR+wrvfLbzd3Vt+8MlZgp4=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=EB1BVtpN2i6EAV78Ce31Ylf6gJl3g20eRepDtCpuya2gLJrkRKRZr+tzuFUnqduzndB5aqUDMnelQhNFRs3u3aSvTR7+16i2ooGKqtxMp5YncX7k/32B98H5zx/yxK0HX6ITV63BENdieiUq50bYrZKwR8OuipWu/RDjIBruxa7yLa+gjXqNituxwFiGjX25n3LroUuVRAr7h/hM6LWM88EXfCex4/8mR/pkhAp8akuo2XBmK4Lb8hKOkBtKkCXKgc0AfDnD3GnQGUW7W20vivcATJZoVHbTW+shtyzaFTkqnYxx0I6aVfJPMl3+GGr11CT0EvPbdbRD3pyZcA2vMQ==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-3 (Postfix) with ESMTPSA id C36FD18000A8;
	Wed, 24 Dec 2025 01:58:06 +0000 (UTC)
Date: Wed, 24 Dec 2025 11:58:02 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, joelagnelf@nvidia.com,
	airlied@redhat.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5] drm/nova: Align GEM memory allocation to system page
 size
Message-ID: <aUtIqv1UfXbh7qQ4@fedora>
References: <20251223135902.35767-1-bshephar@bne-home.net>
 <DF5VBOI4LSTZ.5O2XJRIFMK3S@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF5VBOI4LSTZ.5O2XJRIFMK3S@kernel.org>
X-Proofpoint-GUID: FmAfvr4ms5JeT_V1xU_TcdBp_2YWEs21
X-Authority-Info: v=2.4 cv=LcUxKzfi c=1 sm=1 tr=0 ts=694b48b2 cx=c_apl:c_pps
 a=azHRBMxVc17uSn+fyuI/eg==:117 a=azHRBMxVc17uSn+fyuI/eg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=E7DBk8bC49LunTLxDWoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: FmAfvr4ms5JeT_V1xU_TcdBp_2YWEs21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNCBTYWx0ZWRfX491EzOi0JScr
 Ipn1KhyaxJV3KDhnfwrXftbvzCXPgxd5i3UTc2EE5DFrx5lzzqvKYKmKoIRFd6mIeb/OkNSz21a
 jrA1gvQ74k0+MGVAwsZ7kyjaMWK1x3uqMrbNq21yLCILThnNGqD5CxWIfTjio74R0K417G1y+2Q
 bwu6OsK5L1uQvPWThh5vU5eb8z8PdtXLHRUjCJVU5WAo6O6OAr3KVNFfeNlGAL+NarUe7cRE2jo
 3YzNkoXgJyffx/zqrZtMXtH10fxEdokJGQq+Ju2gyXV2TZHuCsf0lg3+zaY7I3mxYopUYV6oSKv
 OiPf8Cz315DQ12kgFUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=616 adultscore=0
 spamscore=0 clxscore=1030 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512240014
X-JNJ: AAAAAAABTm7GAqzIGBHApEUBJDVwlfxmSo4W4Cp0ar0Gua54XL8MTCpjvxi9t6+dmfHpkCKxkJA9sq/WZJnStaltub8DQ2hHWcFtCxy0N2J15CmcKEqvrsOhTVu1OdKEmById3A+fPr+kLYkbbPkvM0BjSxVTx2PdhZ0PUpzgegcTkLY0kx0bz32Lt48iw5JEQWU9D/huczXTR6uHUDsE1hH1sGjSLcsw/aROfLi1gu/fGtp68oH1fGSpGcJVU6p+Q1pjPFTQgcq0VKFuaRkZjEgNSQ8vSBglr1cDd9cD4pe62LcABlDfq4IJWf9BEfo90mAEkrTgR6OUbcS+Bb1QJFJTrVPPfTx6EsujzUQfXUCMkzpFQEUxtptWL93jNXqRF86VzSIQjMNVaC7o2TuYTztO8ivSOOUMaa4VkpOOs7xJXXf9yVyAkmRmipawdnT9lpD6NclexbP7xyehCV3vf6qObMHbPvd3wQdnBkFKN4isUSffx0na18zNiPXuL/qpurtRG8ZuhhyGQ43fHIr/ynTyVbib+9UwgBJoSfPkjR3g/l3Ek8gr1V6Ic6tukggeDtG7S32mJq6xRTlnLExVxknjTzPUGXRKXPVxa0Y8kVHiF+c07S7BZEBWtOIGC7BY9k7aGAzH8BCBCxgScgq7EOMnJ4lKuEIXw==

On Tue, Dec 23, 2025 at 09:11:36PM +0100, Danilo Krummrich wrote:
> On Tue Dec 23, 2025 at 2:59 PM CET, Brendan Shephard wrote:
> > @@ -31,14 +28,12 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
> >  impl NovaObject {
> >      /// Create a new DRM GEM object.
> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> > -        // Check for 0 size or potential usize overflow before calling page_align
> > -        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
> > +        if size == 0 {
> >              return Err(EINVAL);
> >          }
> > -
> > -        let aligned_size = page_align(size);
> > -
> > -        gem::Object::new(dev, aligned_size)
> > +        page_align(size)
> > +            .ok_or(EINVAL)
> > +            .and_then(|size| gem::Object::new(dev, size))
> >      }
> >  
> >      /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
> >
> > base-commit: b927546677c876e26eba308550207c2ddf812a43
> > prerequisite-patch-id: 7154ef17c3e40275152c90eff07bffcb5ef5e5cb
> 
> This looks like this is an incremental patch on top of some previous version of
> this one.
> 
> However, in this case I don't think there is a need to resend, since I prefer v4
> over this one. Eventually we will need to use size (or aligned_size) outside of
> the closure for further calculations.
> 
> I will pick up v4 of this patch, no need to resend, thanks!
> 

Hey Danilo,

Thanks, no worries, happy for you to take v4. I did build it
against your repo as well and there were no conflicts at the time. Just
the prereq patch to page_align and it was nice and clean.

Have a great holiday mate!

Brendan
